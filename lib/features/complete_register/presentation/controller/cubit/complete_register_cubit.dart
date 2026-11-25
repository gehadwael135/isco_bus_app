import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'complete_register_state.dart';

class CompleteRegisterCubit extends Cubit<CompleteRegisterState> {
  CompleteRegisterCubit() : super(CompleteRegisterInitial());
  final List<String> universities = [
    'Menoufia University',
    'Cairo University',
    'Ain Shams University',
    'Alexandria University',
    'Mansoura University',
    'Tanta University',
    'Zagazig University',
  ];
  final List<String> faculties = [
    'Faculty of Computers and Information',
    'Faculty of Engineering',
    'Faculty of Medicine',
    'Faculty of Dentistry',
    'Faculty of Pharmacy',
    'Faculty of Science',
    'Faculty of Commerce',
    'Faculty of Law',
    'Faculty of Arts',
    'Faculty of Education',
    'Faculty of Agriculture',
    'Faculty of Nursing',
    'Faculty of Physical Education',
    'Faculty of Veterinary Medicine',
    'Faculty of Mass Communication',
    'Faculty of Languages',
    'Faculty of Tourism and Hotels',
    'Faculty of Fine Arts',
    'Faculty of Applied Arts',
    'Faculty of Specific Education',
  ];
  final List<String> academicYears = [
    'First Year',
    'Second Year',
    'Third Year',
    'Fourth Year',
    'Fifth Year',
    'Postgraduate',
  ];
  final List<String> cities = [
    'Cairo',
    'Giza',
    'Alexandria',
    'Tanta',
    'Menoufia',
    'Mansoura',
    'Zagazig',
    'Ismailia',
    'Suez',
    'Port Said',
  ];

  final List<String> lines = ['Line 1', 'Line 2', 'Line 3', 'Line 4', 'Line 5'];

  final List<String> streets = [
    'El Geish Street',
    'El Bahr Street',
    'Saad Zaghloul Street',
    'El Galaa Street',
    'El Nasr Street',
    'University Street',
    'Main Street',
  ];
  bool selected_1 = false;
  void selectedGender() {
    selected_1 = !selected_1;
    if (selected_1) {
      selected_2 = false;
    }
    emit(SelectedGenderSuccess());
  }

  bool selected_2 = false;
  void selectedGender2() {
    selected_2 = !selected_2;
    if (selected_2) {
      selected_1 = false;
    }
    emit(SelectedGenderSuccess());
  }

  final picker = ImagePicker();
  XFile? cardImage;
  Future<XFile?> pickImagCard() async{
   cardImage=await picker.pickImage(source: ImageSource.gallery);
    if ( cardImage != null) {
      emit(AddCardImageSSuccess());
    }
    return null;
  }


  XFile? cardImageCompany;
  Future<XFile?> pickImagCardCampany() async{
   cardImageCompany=await picker.pickImage(source: ImageSource.gallery);
    if ( cardImage != null) {
      emit(AddCardImageSSuccess());
    }
    return null;
  }

}
