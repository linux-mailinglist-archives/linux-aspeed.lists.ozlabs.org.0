Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5479B7B9B26
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Oct 2023 08:43:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=bO1lU3hx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1MT026L5z3cSg
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Oct 2023 17:43:16 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=bO1lU3hx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2607:f8b0:4864:20::a2d; helo=mail-vk1-xa2d.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1MSs5dBBz3cC3
	for <linux-aspeed@lists.ozlabs.org>; Thu,  5 Oct 2023 17:43:08 +1100 (AEDT)
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-49618e09f16so253462e0c.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 04 Oct 2023 23:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696488185; x=1697092985; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YGoaC1Wcp6rYPnjGJSe6VARj9bzOCTTk06EKi9+Z3hA=;
        b=bO1lU3hx8tGlWQAoj4NKDrYcm1B9VRuVMcSh44MwiPMh74aKrXwhb5RCxbWieRk5CN
         FNb+e9ImU5UpUhPqqqcURE0hFxFeUKAN5bZYuksneblEyXP/MsZG3J9pIJLmUoTCQpDn
         b2U8UMk+0UCCBcD9C+o0dggmic6SjHldqp3LIpJkcZJ2EHWXiUVuUWoZy+4Z/omKTlze
         iXYq9FsFCP6wH1+YgIDxNcyv81JDZ3HbVxXBgPPNbYYyNm6TCLNzk/GYqTsPtZPllJ5H
         ypWcj20tonpip2oWW3xvugIf0v/Wx3WkYa+q5zwegEx9uG3ej3c4ZFA4sr3qFEfFywA7
         A0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696488185; x=1697092985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGoaC1Wcp6rYPnjGJSe6VARj9bzOCTTk06EKi9+Z3hA=;
        b=FYPXNA1ypbXMJ0zVDt96RZj+ZawF/XrGV6Uui+VAsXvWQOrnUFyXcNH3lFzd5aeWGs
         6KbUltxTVtDpmbgwXRLy/G3foQ1GpcyXdvEejM2mZ7PJo4hDtS4/LyOF0xNnqgKdx2n+
         dsfN8ukW+QChM4VrrdTwZee9QBOAiPhjG2079Wd0sODqivnSCn9BugNM4vEvQTYfAWeG
         MHS4jHyplE5M1AP9/lbJqg2LpgWvWdUW93dUdU0Qjoz3zm8UoJIyOdiUABxDKtk5HW7b
         D0m5nisXy6DZhLTQ78/0nVR2Izak7/UBoa0mLipf5cu4ZIjnKobvhg56YUVLp1JHmxB6
         w2hg==
X-Gm-Message-State: AOJu0YxMZ6P4CVQik+Tha+QUW4e5rrQcurARQ4z/8D7iX6dvavqOPh/q
	Uyw+7M9UaMfE3x2qwozUeSnmzvIZJcvKDdwAaZDeiA==
X-Google-Smtp-Source: AGHT+IF9AStF08LnnmPoyECeA01wkoJtydwGXomw/31OD+TyB0QeLcMuubWOdNucB26fwKEGuoDDyaTTHksIsQIEO8k=
X-Received: by 2002:a1f:cb42:0:b0:49b:289a:cc3f with SMTP id
 b63-20020a1fcb42000000b0049b289acc3fmr3946166vkg.3.1696488184932; Wed, 04 Oct
 2023 23:43:04 -0700 (PDT)
MIME-Version: 1.0
References: <20231003073926.10771-1-brgl@bgdev.pl>
In-Reply-To: <20231003073926.10771-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 5 Oct 2023 08:42:54 +0200
Message-ID: <CAMRc=Me9QjuM41iRJ9NjQ8kZUJ_yJ5MKXmMhViOka6j71+jVfw@mail.gmail.com>
Subject: Re: [PATCH] gpio: aspeed: fix the GPIO number passed to pinctrl_gpio_set_config()
To: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Oct 3, 2023 at 9:39=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> pinctrl_gpio_set_config() expects the GPIO number from the global GPIO
> numberspace, not the controller-relative offset, which needs to be added
> to the chip base.
>
> Fixes: 5ae4cb94b313 ("gpio: aspeed: Add debounce support")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpio-aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index da33bbbdacb9..58f107194fda 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -973,7 +973,7 @@ static int aspeed_gpio_set_config(struct gpio_chip *c=
hip, unsigned int offset,
>         else if (param =3D=3D PIN_CONFIG_BIAS_DISABLE ||
>                         param =3D=3D PIN_CONFIG_BIAS_PULL_DOWN ||
>                         param =3D=3D PIN_CONFIG_DRIVE_STRENGTH)
> -               return pinctrl_gpio_set_config(offset, config);
> +               return pinctrl_gpio_set_config(chip->base + offset, confi=
g);
>         else if (param =3D=3D PIN_CONFIG_DRIVE_OPEN_DRAIN ||
>                         param =3D=3D PIN_CONFIG_DRIVE_OPEN_SOURCE)
>                 /* Return -ENOTSUPP to trigger emulation, as per datashee=
t */
> --
> 2.39.2
>

Queued for fixes.

Bart
