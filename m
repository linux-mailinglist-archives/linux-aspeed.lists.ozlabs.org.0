Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 342A7918392
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 16:02:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kMRHFUfO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8NgB4P5Hz3cW4
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jun 2024 00:02:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kMRHFUfO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2c; helo=mail-oa1-x2c.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8Ng53klDz30VM
	for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jun 2024 00:02:08 +1000 (AEST)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-25ca04d24dfso3259683fac.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 07:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719410528; x=1720015328; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WlX6ofd4eUvev3IitES3h0rQ2uet+ifDwXi5r0qMYlA=;
        b=kMRHFUfOA884oWCncd8lf8YgiFAy4cpSoPyk6UBaceV5KMjtKiVKIiqSH/BgUkVbIr
         jjnZJF5m+aSQ2SJ2fs3RxWvbya+GZcaZE6khz8Qwud1wb3JZIsSMIBNoKbJRPADyideT
         xz8q6A3r5X+syeZEXDKsLQbSwCZLASLY1hQNkGwczMwvmOFqk8w78MEcyHpRuw/O3i8o
         yMfj/LonmFENvXtLyhf77I75YU2C3Q4NMT3yDsyt8WVZ7o19nokg3ddwL5pOw+K29t2u
         mqwsNryqgq4YcxktYAixl52IftOudBbLkRbokvH5nTjucvnFQ+xCBfhV7V1GJbXzAoaM
         7HdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719410528; x=1720015328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WlX6ofd4eUvev3IitES3h0rQ2uet+ifDwXi5r0qMYlA=;
        b=hG9jXYq1xmb8iYhM62biWEonxgPpUIanVaaBB48B5yGKSK8lK4Z9vMzR0d8KVLJ1nh
         MO1vABxwQH6IRk3zh3A7QkD4lzMw5LfRX4xJo/KGEHivx8l4p6N2oTnfIf0sAnoCFv5s
         awsJDv4exnBZxeJ1eRCPT4pjRAUnrTehSscVraSNEbbxsUw5C2anmzoAN2W24+XdsKxU
         kRjnYcccGUuqIgGU5F0jCtFbFkJz6LRrSAllLUYGsYI+jd4d1YHQSt378qYYmw10kHWR
         W98vokYFGXG6MWUhJ48gaAK42JAF+OrRZkanIbe8mmZ4B5R818ssRzVQAHvgH85x8FUQ
         v41Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXuGf669X/u4nlqeHp01gGdpZNFDmG10ea/Q7+PLVkfVbwQEYjkDNYZcoYlfc2DbuICzBqRNCGYNFCBM00cff3v0SIiV57CRh6xns68g==
X-Gm-Message-State: AOJu0YxIfM+1GKng1S+LhzdeL2b99GqU3Q9sBqSdHVY63hC74bA+Dmet
	W6QqGDLLLjrIcsq4b3I8F4OvZs3cjcUAHnbfoZOMoJQ13EksJbzWofO3+cj7XP8DluYVeCVVGE8
	s0SvekQOpORmW6O9yjmd9Gi82Tts=
X-Google-Smtp-Source: AGHT+IH1IDVeSLxIl19iRxYfSks6SiF5dVhrO6anINHh6vSqqhiBjcUChgbTG/g2pFbZXYVvnqxQn3g8GL6UuLaG9dk=
X-Received: by 2002:a05:6870:702a:b0:25b:3e23:e5e7 with SMTP id
 586e51a60fabf-25d016724b7mr9830696fac.3.1719410528222; Wed, 26 Jun 2024
 07:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240626130332.929534-1-yangchen.openbmc@gmail.com> <CAL_JsqL-b==HMLJGd_e-43yZHjBFYrrLV5J2a=E2LSEck=ii6w@mail.gmail.com>
In-Reply-To: <CAL_JsqL-b==HMLJGd_e-43yZHjBFYrrLV5J2a=E2LSEck=ii6w@mail.gmail.com>
From: Yang Chen <yangchen.openbmc@gmail.com>
Date: Wed, 26 Jun 2024 22:01:55 +0800
Message-ID: <CALFa7M8bgVX_L30J72SqZ-0vzfezoJLtZHnKjL-dZki0kMJFoQ@mail.gmail.com>
Subject: Re: [PATCH v1 00/17] Revise Facebook Minerva BMC DTS
To: Rob Herring <robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, Jerry.Lin@quantatw.com, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, andrew@codeconstruct.com.au, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jun 26, 2024 at 9:38=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Wed, Jun 26, 2024 at 7:05=E2=80=AFAM Yang Chen <yangchen.openbmc@gmail=
.com> wrote:
> >
> > Revise the Linux device tree entry related to Facebook platform Minerva
> > specific devices connected to the Aspeed AST2600 BMC.
> >
> > Changelog:
> > - v1:
>
> You already sent v1. This is v2.
Hi Rob,

I appreciate your reminder. Should I send another patch series and use v3?

Thanks,
Yang Chen

>
> >   - Modify the properties of spi to match the schema.
> >
> > Yang Chen (17):
> >   ARM: dts: aspeed: minerva: change the address of tmp75
> >   ARM: dts: aspeed: minerva: change aliases for uart
> >   ARM: dts: aspeed: minerva: add eeprom on i2c bus
> >   ARM: dts: aspeed: minerva: change RTC reference
> >   ARM: dts: aspeed: minerva: enable mdio3
> >   ARM: dts: aspeed: minerva: remove unused bus and device
> >   ARM: dts: aspeed: minerva: Define the LEDs node name
> >   ARM: dts: aspeed: minerva: Add adc sensors for fan board
> >   ARM: dts: aspeed: minerva: add linename of two pins
> >   ARM: dts: aspeed: minerva: enable ehci0 for USB
> >   ARM: dts: aspeed: minerva: add tmp75 sensor
> >   ARM: dts: aspeed: minerva: add power monitor xdp710
> >   ARM: dts: aspeed: minerva: revise sgpio line name
> >   ARM: dts: aspeed: minerva: Switch the i2c bus number
> >   ARM: dts: aspeed: minerva: remove unused power device
> >   ARM: dts: aspeed: minerva: add ltc4287 device
> >   ARM: dts: aspeed: minerva: Add spi-gpio
> >
> >  .../aspeed/aspeed-bmc-facebook-minerva.dts    | 516 +++++++++++++-----
> >  1 file changed, 373 insertions(+), 143 deletions(-)
> >
> > --
> > 2.34.1
> >
> >
