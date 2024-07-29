Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2348093EAC8
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Jul 2024 03:50:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=njw9bgFM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXLsl0KmGz3cFq
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Jul 2024 11:50:35 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=njw9bgFM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXLsd4K59z3cDR
	for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Jul 2024 11:50:27 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-52efa16aad9so4302280e87.0
        for <linux-aspeed@lists.ozlabs.org>; Sun, 28 Jul 2024 18:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722217820; x=1722822620; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQwsAFM3hC76AQ773wrjNWmUPai4QYsRyLly5BlNDbY=;
        b=njw9bgFM5G/DpSJVg/WMGQjjlwE8CFGC0xcMF++Nqs1enbTLEQ+9aD9IE8baza6Hxl
         aBEIOgNp56/adtaXoo3tEH7FMxB2iwZ+DHdvm7UPELS6m8SVTuZKql5PIc9+WEzzmpuG
         raFFIToINosgbpEjtCJy6SnUYjHGvDjibcJ1VAaI3bzrg0qlZf5X5va3+yQtuplYHcB5
         WrEWDm5DHcGXL+Ok5wrP93MzTHRSmctV+5VIr09x0r7BB5ORSZe4NC1LOppGgL801l12
         tbYQWLn9nI1pOPFdGXvvvZ+W6vlrLkUQVx0OJJmCYQ8BbKp4xzFKcUz1TNZIipoGPYoW
         D97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722217820; x=1722822620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQwsAFM3hC76AQ773wrjNWmUPai4QYsRyLly5BlNDbY=;
        b=QzrxFOeLhUKSGbf0RKgYuEIyh3exTLOhWo76YKjfqf7me848lKo9FpcAOwIoBs7aSp
         6L1kN9l0vkhvmpG70O+HZTJ9jn7Rg/Kv/8jKRJbGgA2oxzxMMWP9rqRYHcyV9aggODaA
         OkSBDk7NW1SO7FECZXPDk2Hms08+LF6E2ab9cH6MX1at48rIss09aWYtITo2mioQxkTP
         b7xGcFw9Ldjxs5lgAdPzrArtBdqI1uZFYezNxV3cbf+JvE9liwEKeBU+typDs99dAjFr
         rgl+9l8BENe1UUpHFiwO44lxxJl4V3WnkHmZZAmzVPU8ri1k96Y33BOctZ1/n4nRD7xX
         P6lg==
X-Forwarded-Encrypted: i=1; AJvYcCWFDzBzMZyOBo4jXmfAGsXXqvdW2kzLTgEf/Xrw8vDAfH3f9Dnb7hNXGJNWZWjzFF6+jNU8BblYiskLq2XUQ41H1d2XzDLPTUV3hALU6Q==
X-Gm-Message-State: AOJu0Yx4cknAdqJgcb72g2KbS0QN1jXTHwmFRESuiecAqd8cqF8j8Jei
	F8zM6kwdPiyVLc0S0XflYy3w3fJvLZvepjzaZ26y3oXapgNmZ88ZOIKqrcOeMaH7EycpYPygNhu
	5XSCDwuJPePF/J3siq8x1cNnavHQ=
X-Google-Smtp-Source: AGHT+IG2fQ9db4L8JJmxDk7HV4wxYgRsFxk5O8HaXTbeBbrhkpr0uX212Bjp7MPM9I2rfq5AiGqF6vbWnVAeub1cI8E=
X-Received: by 2002:ac2:539c:0:b0:52b:8ef7:bf1f with SMTP id
 2adb3069b0e04-5309b2707aamr3601949e87.17.1722217819853; Sun, 28 Jul 2024
 18:50:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240726-potin-catalina-dts-v5-0-8f02305af527@gmail.com>
 <172199921421.1507234.14901757413141840919.robh@kernel.org> <6d73dcf20c726ad59e2aa16e507af17b3af59c42.camel@codeconstruct.com.au>
In-Reply-To: <6d73dcf20c726ad59e2aa16e507af17b3af59c42.camel@codeconstruct.com.au>
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Mon, 29 Jul 2024 09:50:08 +0800
Message-ID: <CAGfYmwVSd846mX=WwhPu9dzZ0-d92jEzWG=dbDA+hQP+25uC9A@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] Add Meta(Facebook) Catalina BMC(AST2600)
To: Andrew Jeffery <andrew@codeconstruct.com.au>
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
Cc: "Rob Herring \(Arm\)" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Patrick Williams <patrick@stwcx.xyz>, Conor Dooley <conor.dooley@microchip.com>, Cosmo Chou <cosmo.chou@quantatw.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Jul 29, 2024 at 9:17=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Potin,
>
> On Fri, 2024-07-26 at 08:09 -0500, Rob Herring (Arm) wrote:
> > On Fri, 26 Jul 2024 18:26:48 +0800, Potin Lai wrote:
> > > Add Linux device tree entry related to Meta(Facebook) Catalina specif=
ic
> > > devices connected to BMC(AST2600) SoC.
> >
> ...
> >
> > My bot found new DTB warnings on the .dts files added or changed in thi=
s
> > series.
> >
> > Some warnings may be from an existing SoC .dtsi. Or perhaps the warning=
s
> > are fixed by another series. Ultimately, it is up to the platform
> > maintainer whether these warnings are acceptable or not. No need to rep=
ly
> > unless the platform maintainer has comments.
> >
> > If you already ran DT checks and didn't see these error(s), then
> > make sure dt-schema is up to date:
> >
> >   pip3 install dtschema --upgrade
> >
> >
> > New warnings running 'make CHECK_DTBS=3Dy aspeed/aspeed-bmc-facebook-ca=
talina.dtb' for 20240726-potin-catalina-dts-v5-0-8f02305af527@gmail.com:
> >
> >
> ...
> > arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/bus=
@1e78a000/i2c@100/i2c-mux@70/i2c@2/pwm@21: failed to match any schema with =
compatible: ['maxim,max31790']
> > arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/bus=
@1e78a000/i2c@100/i2c-mux@70/i2c@2/pwm@27: failed to match any schema with =
compatible: ['maxim,max31790']
> > arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/bus=
@1e78a000/i2c@100/i2c-mux@70/i2c@3/vrm@60: failed to match any schema with =
compatible: ['isil,raa228004']
> > arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/bus=
@1e78a000/i2c@100/i2c-mux@70/i2c@3/vrm@61: failed to match any schema with =
compatible: ['isil,raa228004']
> > arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/bus=
@1e78a000/i2c@100/i2c-mux@70/i2c@3/vrm@62: failed to match any schema with =
compatible: ['isil,raa228004']
> > arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/bus=
@1e78a000/i2c@400/ipmb@10: failed to match any schema with compatible: ['ip=
mb-dev']
> ...
>
> The snipped errors are mostly from the DTSI, but these errors above are
> specific to your DTS. Can you please address them?
>
> Andrew

Hi Andrew,

I tried to follow exist dts files to add the compatible strings, but
all of them are showing error when I manual running "make ARCH=3Darm
CHECK_DTBS=3Dy aspeed/aspeed-bmc-facebook-catalina.dtb".

- "ipmb-dev": arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts at lin=
e 432
- "max31790": arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts at lin=
e 196
- "maxim,max31790": arch/arm/boot/dts/nuvoton/nuvoton-npcm730-kudo.dts
at line 511
- "isil,raa229004": arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dts
at line 512

And there is no .yaml file for these drivers to check the proper
compatible string.
Do you have any suggestions in this case? Thank you.

Best Regards,
Potin
