Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D52C96EC25
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 09:38:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0Slh0pkKz309k
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 17:38:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.219.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725608333;
	cv=none; b=JOrpKUlDas56636e9Hxnnvlc/+Cf0qICxmfgCum+xTbq+/pZl2WLS+JSvAuyTW68aov7ZnOmKiHT22SJrMzCytkfXoFV3cUl0lk+tU/wfVQETAC0a0VN4qWRGfRSd9p4EdT5m/ImlzZMWW947mHuL7bIYETGR7SVztwpy1EhD6HxBMrvnEyy+yGjmhuCra3o3JYiEJDRlSSrx3F1rG9ZGXpBWrkvzV5QVwUYLSqDCfeAhPwiP/bdY5S8C3gKCgrcIIsDFeTsuiVKV+JqTfamj6iLA3Q1+ifjUR7+jeqKnvT6l+jGCLva6QTGOuADI3y+cJha3KiwLGgJn+/kSWcj6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725608333; c=relaxed/relaxed;
	bh=d/xQhV42ZUI1fcy9JagOpFtn+8aZjojJQpKnD2zOZrA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h9m1tYuHFUzrehAaxHMr2W1EPs7f9BMZJ027krmmxLScwgsxSvCyBcRqsZopE3b7GUMkzuN6/eJ8Pve5D07jEug1Hb99mS7u5e0u5yQOQpUSDppUbpISsRouKB62FpE43yp6edB7Yce58t4Ri6CoD56YV0nXJJOKvvsfduwxjulhYHSw8trbBFDvQpCspB/ju329AyZb2LMWn1flzlgNfKKGugm9e3Rvx38bbC4buVp3GuLyPuaNcmTNfl9eNP+n5H7/dpzV87srxetIsXUXZApEEv5X2JOfOyuNYXubVBApnVCdR6olL2RENMmRmRAAL7Rlkns80wyM9nUTJBahIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.219.172; helo=mail-yb1-f172.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.172; helo=mail-yb1-f172.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0Sld1QdBz304C
	for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2024 17:38:52 +1000 (AEST)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e1a80979028so1853250276.1
        for <linux-aspeed@lists.ozlabs.org>; Fri, 06 Sep 2024 00:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725608329; x=1726213129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/xQhV42ZUI1fcy9JagOpFtn+8aZjojJQpKnD2zOZrA=;
        b=tQruUS+8Kc1Nk4TOCrbYyg8DHtKFiAkY5MeMYYg0BQb+8SsB/1IiZjgOleB5K3F6bi
         Dc6HY4pTmUnNiiXGfylMc4LVYA236+LhKlKJsI5Bp1lxwBcBhD/PP6ZV6KqlhMxwNegF
         B9XTOb24RDsx5Ata/Et4EGHItIQ8NIGVF3o1XYVvqidbySKVWvVLNBTh1YaM1p0WxDZR
         xfEFpl+2+xjgfsz0KnoWitUBYz8jZRQJ133af5x/YqxZ6pkm4BZWW+pws0oweZEcdcmO
         13cBAjfIgA2WxR768zJW9UUTdI6MPUKTh+J6cX3joTWZVQJB3Uyeixsp9WZyj4cStkxY
         yYaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGvwAEqgHycZlkAxhbPIWbSy4BVNn4KF0h6/YwQnEgGrE3c3ro2mHChWen32Fan2lMGLf7KDbMhtjQzRI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxslEzMlCUd44/jWy0RURhUwMRZxtENr3nz1Lew4mYnTOnQMmYW
	xCCrRlAeHab8oagMxH6yNfDC8DOkhlrLvMq9AAbUOcoR2RVU4y7gXIErG2tU
X-Google-Smtp-Source: AGHT+IHc2F9F5yDaSIosBhdvt+FwruCcOJxZM/ZlNH5RNTgxTfPRn7ioXFExSVMlDCeSRxk+2y4vWA==
X-Received: by 2002:a05:690c:660e:b0:6d3:82d0:fe4f with SMTP id 00721157ae682-6db44d6871bmr19716297b3.6.1725608328827;
        Fri, 06 Sep 2024 00:38:48 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d3ea2fa6sm31477557b3.45.2024.09.06.00.38.48
        for <linux-aspeed@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 00:38:48 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6d3f4218081so17434337b3.1
        for <linux-aspeed@lists.ozlabs.org>; Fri, 06 Sep 2024 00:38:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVKQzbjjni8WWoIZlSdChLrTpCGOHPS+SKQkPWDUeb5Kollp8/3L7Ja6utSmfJqLOOzrm8pBGp2Ska3QWM=@lists.ozlabs.org
X-Received: by 2002:a05:690c:3384:b0:6db:34ef:95cc with SMTP id
 00721157ae682-6db451649ecmr18327937b3.43.1725608327988; Fri, 06 Sep 2024
 00:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com> <20240906062701.37088-31-Delphine_CC_Chiu@wiwynn.com>
In-Reply-To: <20240906062701.37088-31-Delphine_CC_Chiu@wiwynn.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Sep 2024 09:38:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV80pF+rVhRWeeZy3tyZCr5y=qRWYm1Z655t3ULZJO=yA@mail.gmail.com>
Message-ID: <CAMuHMdV80pF+rVhRWeeZy3tyZCr5y=qRWYm1Z655t3ULZJO=yA@mail.gmail.com>
Subject: Re: [PATCH v15 30/32] ARM: dts: aspeed: yosemite4: add SQ52205 support
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, patrick@stwcx.xyz, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Delphine,

Thanks for your patch!

On Fri, Sep 6, 2024 at 8:35=E2=80=AFAM Delphine CC Chiu
<Delphine_CC_Chiu@wiwynn.com> wrote:
> Add SQ52205 in yosemite4 DTS.

Please explain.

> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>


> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -1245,35 +1245,35 @@ adc@37 {
>         };
>
>         power-sensor@40 {
> -               compatible =3D "ti,ina233", "richtek,rtq6056";
> +               compatible =3D "ti,ina233", "richtek,rtq6056", "silergy,s=
q52205";

At first sight, this looks wrong.
However, these three all seem to be functionally equivalent power monitors.
Are they software compatible too?
There are also no DT bindings to guide us, except for the rtq6056 part.

>                 reg =3D <0x40>;
>                 resistor-calibration =3D /bits/ 16 <0x0400>;
>                 current-lsb=3D /bits/ 16 <0x0001>;
>         };

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
