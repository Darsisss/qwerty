   M S B A M L   `   `   `  ����I  ETradeClientApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null=#clr-namespace:TradeApp.View.WindowsTradeApp.View.Windows  5   	   7 clr-namespace:TradeApp.ViewModelTradeApp.ViewModel  5   	   /    )TradeApp.View.Windows.AuthorizationWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   5local#clr-namespace:TradeApp.View.Windows     5   	   6	ViewModel clr-namespace:TradeApp.ViewModel     5   	     � WindowStartupLocation$  CenterScreen=�5
   	   $��Comic Sans MS)�5   	    � 
ResizeMode$ CanMinimize=�5   	    � Title$6 0ООО 'ВАСЯ ПУПКИН и КО': Вход��5   	   $	��400��6.   $	��400��6>   $	��500��5   	   $	��620��6    � Icon$ /Assets/Images/icon.ico��5       � DataContext 5        TradeApp.ViewModel.AuthVM  5   
   .��5      � $��Center=�6   $��Center=�6(   $	��580��5      $	��470��6    � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   .+�5   
   �� $&�� Добро пожаловать!��6   $��Center=�6,   $��30(�6I   $��	0,-15,0,6q�6W   $��DemiBold"�6j   $��2��6�   �� 5   
   $��\Assets\Images\logo.png��6   $��Center=�61   $	��Top=�6N   $	��150��6f   $	��150��6s   $��0,5,0,0q�6   $��2��6�   $��2��6�   �� 5   
   $#��Для продолжения��6   $��Center=�6*   $��26(�6G   $��3��5      $��
0,148,0,74q�6   $��DemiBold"�61   �� 5   
   $&�� необходимо войти:��6   $��Center=�6,   $��26(�6I   $��3��5       $��
0,182,0,28q�6   $��DemiBold"�61   �� 5!   
   $��3��6   $��10,240,10,-227q�6"   .+�5"      �� $ ��Введите логин:��6   $��16(�6.   $��30��6<    J� RenderTransformOrigin$ 0.536,2.777&�6H   �� 5#      $��14(�6-   ��6   �� *Login+6-   5%      �� 5'   
   $��3��6   $��10,321,10,-245q�6"   .+�5(      �� $"��Введите пароль:��6   $��16(�6/   G� 5)      -   5         G�Name$ password��5)      $��14(�6,   5*      �� 5,   
   -   5         ��Name$ 	btnSignIn��5-   '   $��3��5,      $��30��6   $	��190��6*   $��Center=�66   $��0,405,0,-167q�5-      $��16(�5.   2   ���	#FF76E383��6   �� *ButtonSignIn+6@   �� 5/   
   -   5        $ btnGuest��50   '   $��3��5/      $��30��6   $	��190��6*   $��Center=�66   $��0,465,0,-227q�50      ��51      �� *ButtonGuest+61   52      53      