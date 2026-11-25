import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:image_picker/image_picker.dart';
part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit() : super(CreateAccountInitial());
 final picker = ImagePicker();
   XFile? profileImage;
  Future<XFile?> pickImageProfile() async {
    profileImage = await picker.pickImage(source: ImageSource.gallery);
    if (profileImage != null) {
      emit(EditProfileImageSuccess());
    }
    return null;
  }


    bool isScure = false;
     bool isScure2 = false;
  
  void changeScurePassword() {
    isScure = !isScure;

    emit(SecureSuccess());
  }

   void changeScureConfirmPassword() {
    isScure2 = !isScure2;

    emit(SecureSuccess());
  }
}
