Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5516B96EC61
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 09:45:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0SvX0cCnz306l
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2024 17:45:44 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725608741;
	cv=none; b=ZCFY8RGpSEi3AhRogmjjppwM3ixNMPcBs2cUqOH4ADPtkch8KlxMqc3fJc0sGHLE1wgbiPO/qD4FdbvcrU4CRpvpAlptLEaRsun2Zk2ToCeMiSdy56R2grSfukBKS5HTTud/FMVHQmiGG57dOJ5jTCqBg3hF6kk4PeiZ7CRe1uOAxysTPqQYcYi9wNu0ePd9vbUsExuxZpxa7tI8N9l/ahkbLU5O46kwMVWrRwmNkAHpWzv2Rpp1QUe9S6xqBvQJ8kTEkmneQgAJMQikkFQAGDcqHEgPbWoTD7npGraz+pGhh6uxyiVlGkLXtu6JGVe9q57lqYy9spvksTS2x4cMXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725608741; c=relaxed/relaxed;
	bh=BGCloBLuKJNuQjTKYududIzGAVIj/P9FIhi0OmowDEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aNDZXMDqRbXTWRFnG2lplP6fvnWEZT8bhSSc6MbBXJ8fWPcGMbQbiUQDtd9Z70NygkM3Rhfr8fcWot7GapFNPY60pTRtzZwCE9gg6IjmDW3AZ3aphNZwc+qvaB98O6pYJ1a6ln7qlhzdmIIPOBTMJftxKLvtgQNOFaYBH4/9o8O8HtJqQr6EORp1AYQQ2BklSM4aXrLuEXCPvmwQWxJHqkZxJxWMbMheuDrJEXmrvyu0te0QmksUTsWD1VTpRkIt1DPsBxvmC9zZFE+TMifFsCX1l683bm6oogpui9V/VoCndIn2881RgKaXbnxUFncHg5Ow2WwiEUDGJpxerh+fhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.128.172; helo=mail-yw1-f172.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.172; helo=mail-yw1-f172.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0SvT57t6z2xZT
	for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2024 17:45:41 +1000 (AEST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6d9f0cf5ae3so20544357b3.0
        for <linux-aspeed@lists.ozlabs.org>; Fri, 06 Sep 2024 00:45:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725608738; x=1726213538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BGCloBLuKJNuQjTKYududIzGAVIj/P9FIhi0OmowDEI=;
        b=rZeewdpzjAW8yIdfItgxySiPNeKmckQD6woT5BRzyy3qUkDij1LWJcq3W1YI18kdCp
         KdTiPYEv7M9HY9MD7QKuCZsH+PaGW1qPXgJ1VW2vBWr3t1mMY6yeL7RU2eftLYUdfzqm
         6ykKY1fstF/tpQq/QxUnrJeJRrh4t4EpHSbu7DhR53+Q4bpRoNY5c1i60JLVU6LD3VV5
         INBWeTdV40AbHHaTtzAZgkoTltxRmNcZaTXBi2PqNsdLVBpzRWuuGtwMRfL/IS/mFeIz
         NVXhD3purzlRRmYToB9Pkw+fjsVMDjcuol2Pgr20KrwEGmHWfA+YY83Qj0M9YzJASFYJ
         Idsw==
X-Forwarded-Encrypted: i=1; AJvYcCWYpPVE34E6SqpDf6RHBe9MS0Gcim7+iQeBO/fKCbwIxw8h9yJIxl6520cl8ET2sa+qb0N6JrHNoxH+45k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwbS7JAKH7QK7YQI+SbAiOPYNliIl2urPcysV+aUaCidIqW/I1S
	YCLfcz4D+OVaTO2IoKJe4fHnckSn8qi190iOXvg3Epjm/9Z/zYRN9Hd4EK7t
X-Google-Smtp-Source: AGHT+IHQ9VgYOGBfWhFi40yOTY1pi9IRnpAKIBVQ1IeZur60ryy13QLOM9ENOCxLDKCrH7jfmY3XRg==
X-Received: by 2002:a05:690c:4e10:b0:6c9:9341:1c45 with SMTP id 00721157ae682-6db44dc73c0mr15458347b3.14.1725608738594;
        Fri, 06 Sep 2024 00:45:38 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d3da070ce9sm28291297b3.14.2024.09.06.00.45.38
        for <linux-aspeed@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 00:45:38 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6b747f2e2b7so15888387b3.3
        for <linux-aspeed@lists.ozlabs.org>; Fri, 06 Sep 2024 00:45:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2G5eCnypIiStYIZWDknSfqwsvwxAdwE4hTYHwlWllTXMRTs8aICGyuew0kW317/YTxCJeW9dxsYB5VIM=@lists.ozlabs.org
X-Received: by 2002:a05:690c:1b:b0:6b5:916d:5a8 with SMTP id
 00721157ae682-6db44f2f48amr21186587b3.23.1725608738264; Fri, 06 Sep 2024
 00:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com> <20240906062701.37088-24-Delphine_CC_Chiu@wiwynn.com>
In-Reply-To: <20240906062701.37088-24-Delphine_CC_Chiu@wiwynn.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Sep 2024 09:45:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXs=hOgzorsh=Ezf65-3STVtBHrTaM2o==cUm9H_ftCSg@mail.gmail.com>
Message-ID: <CAMuHMdXs=hOgzorsh=Ezf65-3STVtBHrTaM2o==cUm9H_ftCSg@mail.gmail.com>
Subject: Re: [PATCH v15 23/32] ARM: dts: aspeed: yosemite4: add fan led config
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
> Set fan led config in yosemite4 DTS.
>
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>

Thanks for your patch!

> @@ -75,6 +75,154 @@ tpmdev@0 {
>                         reg =3D <0>;
>                 };
>         };
> +
> +       leds {
> +               compatible =3D "gpio-leds";
> +
> +               fan0_blue {

Please no underscores in node names.
LED node names should follow the pattern in
Documentation/devicetree/bindings/leds/leds-gpio.yaml.
LED color should be described using the "color" property, cfr.
Documentation/devicetree/bindings/leds/common.yaml.

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
