Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF967A4133
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Sep 2023 08:30:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=dkT8g4JZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rpw0T67fZz3bZv
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Sep 2023 16:30:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=dkT8g4JZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f36; helo=mail-qv1-xf36.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm2M62Rbtz3fW4
	for <linux-aspeed@lists.ozlabs.org>; Thu, 14 Sep 2023 00:06:57 +1000 (AEST)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-649edb3a3d6so4551216d6.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Sep 2023 07:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694614014; x=1695218814; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SVzpvJyQ79cqOeCOnbam7O9cjKj9BttoysEnsRs/uM=;
        b=dkT8g4JZHaJfEUAnROP0jCAJxrgG6CVUc4153TMZBDnqwevR//USxk5HChc/iEX1JL
         CiFIJxy34VVSuRPwhRoJWIT5+6l1n+OIc/s/AAxunj13eMU9T742CBAO3hM+7IBqTK96
         FJxcdSwPSPQx8Ze3muPFkSwr6vMbWzaJuHsKHWvjL7vpYBzcxZ45fyBatCcjC1TW0gIw
         aBW7ar5c7aBamequGu3aotAqgjpKye+s6bXhiPRwFBiygtrRwRtPd2YJbWoAUN2W4pUS
         t/Qdl3VlZHa+xDmaRzwV163xui0qMSPZVMP/aKTEzdQQSNX3QNobu6/wk63KlePCpJP2
         JXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694614014; x=1695218814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4SVzpvJyQ79cqOeCOnbam7O9cjKj9BttoysEnsRs/uM=;
        b=LS98KNrCC68OEjP/vD6SEQzoqIxoUV3yibqPNeeB9KhPC/EoWKZor1VJ2L/Xksgtw0
         DnXyhGK5pxcIrsEgGlJb6unJI+l8MdSapAClrkw7Cgk73LIU1cJ/UuahW9iZyCWvMG6v
         kiFiJ/LFf/v0sYuJDXxchVwyNkpbAx+rIchksgUEIxI5UlWwHZBIq13MFNrbbadPnBIN
         taf8VxFcUAQdqjbDUCRK9OR6AZy+5D7Ney9Zg54Wpv8Y5CHpgRjT/F/5ZuuOnhEVxdZj
         oT/PYnGwDf14RmU6sODl3q7k6jXEkcvJ+WPm5t7HFreFIPbFrObKeTtrUnaRkJH/+x2O
         2irA==
X-Gm-Message-State: AOJu0YwI3AQvrKYPYpx5sfuT4p5TXL1l+eb3QHJ/dP9cLMFd42c/GIEr
	XVZ48U/qLpteoon1gx2EVwNLj+3TYijd6dQrh9sPyWGgVVQ=
X-Google-Smtp-Source: AGHT+IGUBofx2QUGO40aHH0tMK0OQB083JOU4Kl31Ibbf/55KPiYWU6g3VDRmXNrjg+zyMkEylga1UnXSckBBe6qmmA=
X-Received: by 2002:a05:6214:2cc6:b0:656:12e4:cb87 with SMTP id
 lf6-20020a0562142cc600b0065612e4cb87mr847046qvb.25.1694614014483; Wed, 13 Sep
 2023 07:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230912140532.3797736-1-yangchen.openbmc@gmail.com>
 <20230912140532.3797736-3-yangchen.openbmc@gmail.com> <1bfdc230-e358-6aa4-7d60-03b5477a6be9@linaro.org>
In-Reply-To: <1bfdc230-e358-6aa4-7d60-03b5477a6be9@linaro.org>
From: Yang Chen <yangchen.openbmc@gmail.com>
Date: Wed, 13 Sep 2023 22:06:43 +0800
Message-ID: <CALFa7M_bAvpm50Mvi738ZcY_oQUgJftZO56Eht7Kw9n80H2oow@mail.gmail.com>
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

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> =E6=96=BC 2023=E5=B9=
=B49=E6=9C=8813=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:04=E5=AF=AB=
=E9=81=93=EF=BC=9A
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
Thanks for your advice, I will change this property to
"aspeed,int-vref-microvolt" which is defined in the binding in the v2
patch.

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
Thanks for your advice, I will change this property to
"aspeed,int-vref-microvolt" which is defined in the binding in the v2
patch.

>
>
>
> Best regards,
> Krzysztof
>
