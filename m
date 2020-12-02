Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD102CB529
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Dec 2020 07:41:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cm8WH0mv0zDr4L
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Dec 2020 17:41:15 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=TmhU1G/c; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cm8W55Dq4zDr13
 for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Dec 2020 17:41:03 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id d9so336729qke.8
 for <linux-aspeed@lists.ozlabs.org>; Tue, 01 Dec 2020 22:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VsQG66ogMkwZdKFQkQN61BxKHgVwTX3yIoCFi8hjgmk=;
 b=TmhU1G/civwSH2xVNR+wd8Tc38tSsSF/BEjXVOgCrgkDAX3yAgSHDI6iOmol8viFZ/
 V/LgV2Esto9D7YRAwpElOZDJN1nrefaMvZX1UfX2m68TLwwHjnvJc3AaXzRZ4duxgwt3
 oR4vtgwTOqk4ox6BrNdB15Fb/ud2oGwVdk7Sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VsQG66ogMkwZdKFQkQN61BxKHgVwTX3yIoCFi8hjgmk=;
 b=IdRWOiBo/Nqya/u9h+kdKjUljbhZKUCTjqYyAfXl9EtaHXp3LxMfZ8+7UyJ1pPucSw
 YfyszJPp2I7T0jmXpMz06SmGcetjkHobxFBWXNAn/a7vEredzoCGT3gkojZCxYlcc045
 SiX5TuK6q9H8e2u9w4BIpZwIvxA94691cnnA0gXQo2DdNVG7tvEmboKB/AwjLD78iB/W
 /UPKY8JB8DXLXKpyPgmerPuTw61mfKcSuHrfDOfZZzTGP8HofDBvqfuLxKcAGZVYbL8L
 L8uUw4IrMZ7v9fUiluXS2IHoIidP8JB/DryvmDdo0EbRhxRBWSxNy2Egey6o7vchgr5y
 5ZnA==
X-Gm-Message-State: AOAM532jWz7SanMSKTtKRlwoBkgJ048It0eQZEF4UAW7dyDH5cdFHjTI
 JQuORbdFb8nk82xARs14TTuD4DrXOKAKodBrAqE=
X-Google-Smtp-Source: ABdhPJyHhjBvQ5jmIJOnO5MBEjtcEXfCH94HEH1dTW3C/wpL1Eixxs2Byoua6rHNv4K98W/gOC+5oELpg7lvVLVbCkc=
X-Received: by 2002:a37:6805:: with SMTP id d5mr1164392qkc.66.1606891259402;
 Tue, 01 Dec 2020 22:40:59 -0800 (PST)
MIME-Version: 1.0
References: <20201202063612.21241-1-troy_lee@aspeedtech.com>
In-Reply-To: <20201202063612.21241-1-troy_lee@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 2 Dec 2020 06:40:47 +0000
Message-ID: <CACPK8XfySi5=r4e__djHg-LtFqhV7j+-Pp+t4zevro=KK0eBig@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: edac: aspeed-sdram-edac: Add
 ast2400/ast2600 support
To: Troy Lee <troy_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tony Luck <tony.luck@intel.com>,
 James Morse <james.morse@arm.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>,
 Robert Richter <rrichter@marvell.com>, leetroy@gmail.com,
 Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Stefan Schaeckeler <sschaeck@cisco.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:EDAC-CORE" <linux-edac@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2 Dec 2020 at 06:37, Troy Lee <troy_lee@aspeedtech.com> wrote:
>
> Adding Aspeed AST2400 and AST2600 binding for edac driver.
>
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>

Acked-by: Joel Stanley <joel@jms.id.au>

> ---
>  .../devicetree/bindings/edac/aspeed-sdram-edac.txt       | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/edac/aspeed-sdram-edac.txt b/Documentation/devicetree/bindings/edac/aspeed-sdram-edac.txt
> index 6a0f3d90d682..8ca9e0a049d8 100644
> --- a/Documentation/devicetree/bindings/edac/aspeed-sdram-edac.txt
> +++ b/Documentation/devicetree/bindings/edac/aspeed-sdram-edac.txt
> @@ -1,6 +1,6 @@
> -Aspeed AST2500 SoC EDAC node
> +Aspeed BMC SoC EDAC node
>
> -The Aspeed AST2500 SoC supports DDR3 and DDR4 memory with and without ECC (error
> +The Aspeed BMC SoC supports DDR3 and DDR4 memory with and without ECC (error
>  correction check).
>
>  The memory controller supports SECDED (single bit error correction, double bit
> @@ -11,7 +11,10 @@ Note, the bootloader must configure ECC mode in the memory controller.
>
>
>  Required properties:
> -- compatible: should be "aspeed,ast2500-sdram-edac"
> +- compatible: should be one of
> +       - "aspeed,ast2400-sdram-edac"
> +       - "aspeed,ast2500-sdram-edac"
> +       - "aspeed,ast2600-sdram-edac"
>  - reg:        sdram controller register set should be <0x1e6e0000 0x174>
>  - interrupts: should be AVIC interrupt #0
>
> --
> 2.17.1
>
