Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAF096EC3A
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 09:42:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0Sqc48Wsz306l
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 17:42:20 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.219.171
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725608537;
	cv=none; b=L1eT9l97zjXXOVKLXNHs5G+pmJuGzpXVO9it92iZ0xngamDB/8imelH5D2OicB6qwAmniMIgIBjOfNeOk8BHUSpD//PHvA9UDmhKg9Wb3JvSUv0lxdwqEXv2Op2AYDthpxnsrixrNj+OxNDl2Q95XHf3aZDzoBpSOrFXNvYyE1QXUlme6UN54lhaW8S7grr9i/m5vYd5mwZ4rbPeKrgzaWqeJXElKPXRwE6UupvNFIRv40Sthy2sK+Spw8PuHHuwWCp2dDUAXHeOLUFAMh7LLPNAHSniY0/dwn0GbOu9f5oPSjBfptT/xHf4MLeF7QNmQvAGIc1lIaUxz5MohJBDQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725608537; c=relaxed/relaxed;
	bh=HOu0qyAEJ6R+fXCEatl02fSOu2FCjiv0QYlkkw1DK6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fa/2QXI1yTgyv+KiP7fdU0eg5+iMaKhOgJ5BgRX/h6HcJVNcIQq/TARaHPkE7S216jmFbNR2wJto21R1hAooGmXuq3EaRkxSTpIuC7FP3ISMDWKHWlJfnijmxjRMMw7COPCSHHD4roVOBWa+pukVW47QTvV9XSRFOioPL5ZLYEPOTwbvLn4bUFyGZKqSJV2HzN74ApGY2Ieqiq9VicJ2P5tCg+nfuZBaiRgq+fuc7OuqIzPIMg0S5CNhHDOOgDSHSLax0+8R/dNV8bbWAGoi/0TSVq0LupbjxZ4YGeqYoIefHHw4FJswtv1ZZqPsdes4S4CTC9lnCQfgUQluUdrLPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.219.171; helo=mail-yb1-f171.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.171; helo=mail-yb1-f171.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0SqY2VSRz2xZT
	for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2024 17:42:16 +1000 (AEST)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e1a90780f6dso1833833276.0
        for <linux-aspeed@lists.ozlabs.org>; Fri, 06 Sep 2024 00:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725608534; x=1726213334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOu0qyAEJ6R+fXCEatl02fSOu2FCjiv0QYlkkw1DK6Y=;
        b=PMoM/3nZWcAA52JU/8tXlzV77NMmB1hR94V79ahvo/VzDrypuBrSOkOg5Cxx34AKdb
         wqx0bedMV/CzLK04ehoQwdObgcyyUB+o4/ImQWAD9c5qhvtVgfpFsJ23KciFPVw9QgLa
         8qqZTehuSe9h567fcW5yREQpCwo5S6ofAEWZsDxzitMVnz9Om/HID+WCuo5m37EP28Ia
         mosa81EnEepPQ10O1yUYepIWah2VVRicP4iTW3BlBaLR9n//eqFS2ZFnVUR1JfxfHY56
         f61XIlQ7W83H/qy8VPvjcrWyfXtf7pYcxEb0zy6d8hy+dekLk94IR6urig7JMd0rQZBQ
         KXUw==
X-Forwarded-Encrypted: i=1; AJvYcCXft0pQIRCLjXYpqhQ9l3rFJ+Z4YW0i3ppHuQe9JExh20+gbN8ZdPmHzk9lVMwzqHmVY1bQil5kfUjz3ys=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz8bG0nR85kYSIPG6psY3M6SzB7vZoVzBQ4jzTv/rpW+br0Q/am
	0K7Fj/p7QuXOuMg9Ne/L5AKWvPA+mrx8xG6Na7OdBRn7NCMw460jImyhwGHX
X-Google-Smtp-Source: AGHT+IFR+2bEfvezZlYugEFjyfxOU9etM0YUtUFC7AQ2NRg0g+WcMoJi5BB0QZm6jUUCbSlYbpuabw==
X-Received: by 2002:a05:6902:158e:b0:e03:61d4:ab35 with SMTP id 3f1490d57ef6-e1d34a2cabcmr2099679276.53.1725608534123;
        Fri, 06 Sep 2024 00:42:14 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1cefe6afefsm1709285276.62.2024.09.06.00.42.13
        for <linux-aspeed@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 00:42:13 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6d9f0cf5ae3so20519607b3.0
        for <linux-aspeed@lists.ozlabs.org>; Fri, 06 Sep 2024 00:42:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3ef0B7EqnV3cCB55eH1GPtZuB/2e8MHfh26HoD82+JxJx276DT+hSkVHkhiHO5fT+HcQiFjTaKyhyqR8=@lists.ozlabs.org
X-Received: by 2002:a05:690c:d1a:b0:6db:2753:cd9c with SMTP id
 00721157ae682-6db45273f36mr19818387b3.44.1725608533743; Fri, 06 Sep 2024
 00:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com> <20240906062701.37088-23-Delphine_CC_Chiu@wiwynn.com>
In-Reply-To: <20240906062701.37088-23-Delphine_CC_Chiu@wiwynn.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Sep 2024 09:42:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXFC-TMNdJryq4MBh+QQOntxdHYJrfP2kLqxJk7LKgb9Q@mail.gmail.com>
Message-ID: <CAMuHMdXFC-TMNdJryq4MBh+QQOntxdHYJrfP2kLqxJk7LKgb9Q@mail.gmail.com>
Subject: Re: [PATCH v15 22/32] ARM: dts: aspeed: yosemite4: Revise i2c duty-cycle
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

On Fri, Sep 6, 2024 at 8:28=E2=80=AFAM Delphine CC Chiu
<Delphine_CC_Chiu@wiwynn.com> wrote:
> Revise duty cycle SMB11 and SMB16 to high: 40%, low: 60%,
> to meet 400kHz-i2c clock low time spec (> 1.3 us) from EE request
>
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -761,6 +761,7 @@ eeprom@54 {
>  &i2c10 {
>         status =3D "okay";
>         bus-frequency =3D <400000>;
> +       i2c-clk-high-min-percent =3D <40>;

This property is documented nowhere, except for a not-yet-accepted
patch submission in 2022. It looks like you've been told before, multiple
times...

>         i2c-mux@74 {
>                 compatible =3D "nxp,pca9544";
>                 i2c-mux-idle-disconnect;

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
