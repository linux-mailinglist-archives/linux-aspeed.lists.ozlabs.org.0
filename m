Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB9F7A4137
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Sep 2023 08:31:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=E80FXh98;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rpw0l1Wjxz3cR9
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Sep 2023 16:31:03 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=E80FXh98;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f33; helo=mail-qv1-xf33.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmT011rxxz3bgs
	for <linux-aspeed@lists.ozlabs.org>; Thu, 14 Sep 2023 17:06:55 +1000 (AEST)
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-64aaf3c16c2so3911836d6.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 14 Sep 2023 00:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694675210; x=1695280010; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdMJftDb2abTrZue0NcN+6ucPSI/cjbXwCs/rx5nuBI=;
        b=E80FXh98Pt1G2oOdmDiTDXOaYrBQm/Ba84i3ycy0uRNUBzlmTTrtK976yus9aStfvr
         IJx2xGF/ItKYXv0CYQtjaBVcssmQ0RPkZsemKQFR52ens2/nv7swafNh4KqEYZrZX1Hd
         A1Yft5ebVGP7rltNfVYPDTpuphSsq/wf5TM3q5byYEVG8y6hQQVG/qR/z4sVg1P8oKyG
         YysnQLdYl53mQOfSkE0EWg4W4DCtIXVYLv949ZHBFUtey5AZoAp2veKkw3v3EN7eobzC
         zUuxwKNQJ3YcoZWfPDWOnS97CVdDRHpt5KY2V/qre7obAG1l7laoWUc7Qt1wjD+fwTX+
         ExrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694675210; x=1695280010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CdMJftDb2abTrZue0NcN+6ucPSI/cjbXwCs/rx5nuBI=;
        b=w5TPIriF4etl0pSLLWCJ2+iJDhkC/qYUFErHN0o68QUXQuMYuodvV9mqcWjNvZ6p1/
         KC6hQCEh9aE3bK2hWUL1u3wKNdgTWnDLZqkvsIt/d5H52c4i3owWi62PUmxcO0gycPD2
         mfzbcJ6LJx6mEi4TtlzVRY3tcTiIdnlnVMxcOgpmk3miNzoB+lQLYQsFWIjQzOkhsb6Q
         lu34cXkLE1ZCEUiXrr6FTshastBdGNrFxLpiTgEaw74cS5AZidnwLgQIBMQks2fu+Twq
         FKAjSM5YYofa4PbgqdNF6luodmXXipFFjz6sILR9V5p0yxr9doGU3MWx6dlOFOBn80ys
         PlqA==
X-Gm-Message-State: AOJu0YwSkSMCBa+ZhVOkoQkXfjNJgiDIb03FC53IfP3z8da+DBbgGNMK
	gj0gr+2SUU2J5sVKrBRHtXLs6lk3B6JKkyCLDU8=
X-Google-Smtp-Source: AGHT+IFqMtl/34KkZbegI6c9ryJlkvbUxhils7C7k7j6r6kOxcF5Y/+mKtx4G0fmvBIO0rSFFwBDjSW6Gw84IZF5D14=
X-Received: by 2002:a05:6214:c83:b0:655:ddd7:fcab with SMTP id
 r3-20020a0562140c8300b00655ddd7fcabmr6324953qvr.49.1694675210300; Thu, 14 Sep
 2023 00:06:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230912140532.3797736-1-yangchen.openbmc@gmail.com>
 <20230912140532.3797736-3-yangchen.openbmc@gmail.com> <1bfdc230-e358-6aa4-7d60-03b5477a6be9@linaro.org>
 <CALFa7M_GvCgmEZxvo_ZSYoCPOe+9-tQt3KHn=_cu3n7psP+PTA@mail.gmail.com> <11c822f3-96f1-17d6-6c2a-feaa950aeea1@linaro.org>
In-Reply-To: <11c822f3-96f1-17d6-6c2a-feaa950aeea1@linaro.org>
From: Yang Chen <yangchen.openbmc@gmail.com>
Date: Thu, 14 Sep 2023 15:06:39 +0800
Message-ID: <CALFa7M-9N=J-WKOU=ZbLsFfXvw7=Gmw28DXdKuvuQ7Kyf=5x9g@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Minerva: Add Facebook Minerva CMC board
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 18 Sep 2023 16:30:23 +1000
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
Cc: devicetree@vger.kernel.org, Jerry.Lin@quantatw.com, EasonChen1@quantatw.com, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Eddie.Chen@quantatw.com, patrick@stwcx.xyz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Sep 13, 2023 at 6:04=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 12/09/2023 16:05, yangchen.openbmc@gmail.com wrote:
> > From: Yang Chen <yangchen.openbmc@gmail.com>
> >
> > Add linux device tree entry related to the Minerva Chassis Management
> > Controller (CMC) specific devices connected to the Aspeed SoC (AST2600)=
.
> >
> > Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>
> > ---
> >  arch/arm/boot/dts/aspeed/Makefile             |   1 +
> >  .../aspeed-bmc-facebook-minerva-cmc.dts       | 265 ++++++++++++++++++
> >  2 files changed, 266 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerv=
a-cmc.dts
> >
> > diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/
>
>
> > +
> > +&i2c15 {
> > +     status =3D "okay";
> > +
> > +     eeprom@50 {
> > +             compatible =3D "atmel,24c128";
> > +             reg =3D <0x50>;
> > +     };
> > +};
> > +
> > +&adc0 {
> > +     ref_voltage =3D <2500>;
>
> There is no such property in the bindings.

Hi Krzysztof,

I will change this property to the "aspeed,int-vref-microvolt" which
is defined in the binding that can choose the ADC internal reference
voltage is 1200000 or 2500000 =C2=B5V, and will add these changes to the v2
patches.

>
> > +     status =3D "okay";
> > +     pinctrl-0 =3D <&pinctrl_adc0_default &pinctrl_adc1_default
> > +             &pinctrl_adc2_default &pinctrl_adc3_default
> > +             &pinctrl_adc4_default &pinctrl_adc5_default
> > +             &pinctrl_adc6_default &pinctrl_adc7_default>;
> > +};
> > +
> > +&adc1 {
> > +     ref_voltage =3D <2500>;
>
> NAK, there is no such property.

I will change this property to the "aspeed,int-vref-microvolt" which
is defined in the binding that can choose the ADC internal reference
voltage is 1200000 or 2500000 =C2=B5V, and will add these changes to the v2
patches.

Thanks,
Yang Chen
