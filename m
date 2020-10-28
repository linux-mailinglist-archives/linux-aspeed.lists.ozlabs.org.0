Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B93529CE23
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Oct 2020 06:28:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLcYb2wZ8zDqQl
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Oct 2020 16:28:35 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=CAj6eWB0; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLcYT2HJFzDqCG
 for <linux-aspeed@lists.ozlabs.org>; Wed, 28 Oct 2020 16:28:28 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id c5so2801714qtw.3
 for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Oct 2020 22:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1KYUIsk757yjfOxOTjonub4YNOxpUYnyLgvt2WlwCKA=;
 b=CAj6eWB0sS+KsIEA8xhTCYPe5pKspk9Ybsrx10g+8JQkR4ESP2zrbUkymyWAqsq/xs
 yp0cbkj/HY3yu/hbdX4Sbi7hBUS3W+lUF2jmV7VixEZ4x8skpPJoCA3dbKLvdbUHvdM7
 GZiHCfEh+1ocFVmHvVqBqL37mcGEqztbBVIG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1KYUIsk757yjfOxOTjonub4YNOxpUYnyLgvt2WlwCKA=;
 b=J3Qp1I26IX+mEYOQIoh8J1Zk3WeE0snl1hPF+VQ3/mvDlfK0QKRgjrcky32TX7F1FY
 0+AqsUhYCCDpxtPHMIOhEbvsXPuQoqu2gmgV3DwQqw/TN167wxli06SIve1/us1unxtR
 7OmR1XeUbtmyFnrYkaxNCD6B/tHYjtvLz8Endmv0aCAAl1ry6Y/t9F+8oPQ/UoxOVcBF
 Je+Lys5mrIsQCQ0qsds2/+uU9Z4cJdt3TockkFCnKg1yBWwKZmgiEEW81SjvUE848pgH
 SW9p8ocJVyuOBWF2AdtEgRdy3NiaIi5he5/nffcXosCLKajdPsyKPJjq+aphPfpd0YXC
 MZOA==
X-Gm-Message-State: AOAM530rhvm1X6UWG0h+z34ZR5F2mrxCmaHsP1e7L8TYNg8rZsFlzAGY
 rFV7KUOnCXTO3N8EUsmntAJ973c5Css2WZ7uU+E=
X-Google-Smtp-Source: ABdhPJxjYiVx/jlqIHQCiS7hEo1CokIeLOSw3uzWA56UCJv3gAepbfgYpwPTPl37ADtRKOhjzlpQ7YzLLsQdjIMDdXw=
X-Received: by 2002:a05:622a:d5:: with SMTP id p21mr67362qtw.363.1603862906529; 
 Tue, 27 Oct 2020 22:28:26 -0700 (PDT)
MIME-Version: 1.0
References: <20201027123722.2935-1-aladyshev22@gmail.com>
 <20201027123722.2935-2-aladyshev22@gmail.com>
In-Reply-To: <20201027123722.2935-2-aladyshev22@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 28 Oct 2020 05:28:13 +0000
Message-ID: <CACPK8XeaWbrWBKonxqW0Gu2AnB3mXBNXsEDmsEP_hzT1e8gX1w@mail.gmail.com>
Subject: Re: [PATCH 2/3] ARM: dts: aspeed: amd-ethanolx: Enable KCS channel 3
To: Konstantin Aladyshev <aladyshev22@gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Supreeth Venkatesh <supreeth.venkatesh@amd.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 27 Oct 2020 at 12:41, Konstantin Aladyshev
<aladyshev22@gmail.com> wrote:
>
> The KCS interface on the LPC channel 3 in the controller
> is used for the in-band BMC<->BIOS IPMI communication.
> 0xCA2 is a default host CPU LPC IO address for this
> interface.
>
> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>

I don't have any docs on the platform so I'll wait for a review from
Supreeth before applying this one.

It's a correct use of the bindings:

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> index 89ddc3847222..2a86bda8afd8 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> @@ -147,6 +147,11 @@
>         aspeed,lpc-io-reg = <0x62>;
>  };
>
> +&kcs3 {
> +       status = "okay";
> +       aspeed,lpc-io-reg = <0xCA2>;
> +};
> +
>  &kcs4 {
>         status = "okay";
>         aspeed,lpc-io-reg = <0x97DE>;
> --
> 2.17.1
>
