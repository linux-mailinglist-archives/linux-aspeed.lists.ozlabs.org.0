Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B00314769F
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Jan 2020 02:22:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483hFX460NzDqZC
	for <lists+linux-aspeed@lfdr.de>; Fri, 24 Jan 2020 12:22:08 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=T9dkl4o2; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483hFK4lcWzDqWw
 for <linux-aspeed@lists.ozlabs.org>; Fri, 24 Jan 2020 12:21:56 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id h23so574862qkh.0
 for <linux-aspeed@lists.ozlabs.org>; Thu, 23 Jan 2020 17:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=17LlDvr3P+aPnbiTd/Xv0AEpyX3plN5wLIAiiiLM3JM=;
 b=T9dkl4o2yEUKj+mpTrje5F4r+Sy39rUUnsVelGI8H1iTPAY9q6tnTk2rdnu78ranin
 99U0gCXbQ0OQCO7ibpHdBQz5Lw/mACQcGZDkkH7VDcUUYiR1rmPWJNCcorE5kEOsIyuF
 +HWUw6W8WnOVeB5jH81Wh5l37Sh4JwGP9V1JI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=17LlDvr3P+aPnbiTd/Xv0AEpyX3plN5wLIAiiiLM3JM=;
 b=Th/fwlx4tXhy4FUGPNXDNg+QKKjhTfSLXZCfP3gwxIi7BbJYCePN1x5xRx3kEl3NA3
 2teFoWixTZIaIKIr1JPApZyf9ZvtkLk117iNYvxqUtx3LQ5QKCVsKqzCtyug7ltEBHES
 IzYCrLYmsMTc2oZHiG7Ic8fwCu5MnRRrkU9zUQ/OrWO9vTh3dPjaqS/3t4CraAPBirKy
 +ZVvMaSrnLpdChnW3CPLS6ybCO+IGhQQEiOny7gdUAGOo88oiPp7jM0u6IYwoMnet+qY
 ES7J4ZFc+Wk2bV8Nh9m8YWLy/epcacsL45ZNU++kEbpbYnnIN4TH+RkWG8fXRL7vT7q4
 7ffg==
X-Gm-Message-State: APjAAAWmGMMCBdNCWgR5QM9MsYHk5QPmfQB3nMi6IcmEFTLUYUvB1ezw
 kACPvthQz4Zg+cIXhrqW3XMS2HVJsqg8HMriCJE=
X-Google-Smtp-Source: APXvYqyNwDovBIOpVeX3aeLO2sskA0EZZmPzVBRqgbojfXQFpYEHw2wY9F00g8420CfluzcZbzVJOCQFPD7svOkBKtQ=
X-Received: by 2002:a37:9dc8:: with SMTP id g191mr322080qke.171.1579828913107; 
 Thu, 23 Jan 2020 17:21:53 -0800 (PST)
MIME-Version: 1.0
References: <20200124011747.18575-1-sashal@kernel.org>
 <20200124011747.18575-5-sashal@kernel.org>
In-Reply-To: <20200124011747.18575-5-sashal@kernel.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Jan 2020 01:21:40 +0000
Message-ID: <CACPK8XeGLW6cm9UV7gqrOF18BzsRBppzLQLY6G=Y2MDj2Yrnhw@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 4.19 05/11] ARM: config: aspeed-g5: Enable 8250_DW
 quirks
To: Sasha Levin <sashal@kernel.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

HI Sasha,

On Fri, 24 Jan 2020 at 01:17, Sasha Levin <sashal@kernel.org> wrote:
>
> From: Joel Stanley <joel@jms.id.au>
>
> [ Upstream commit a5331a7a87ec81d5228b7421acf831b2d0c0de26 ]
>
> This driver option is used by the AST2600 A0 boards to work around a
> hardware issue.

This hardware was only supported from 5.4+, so I think we can drop this pat=
ch.

Cheers,

Joel

>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  arch/arm/configs/aspeed_g5_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspe=
ed_g5_defconfig
> index 02fa3a41add5c..247be6c23d2c6 100644
> --- a/arch/arm/configs/aspeed_g5_defconfig
> +++ b/arch/arm/configs/aspeed_g5_defconfig
> @@ -138,6 +138,7 @@ CONFIG_SERIAL_8250_RUNTIME_UARTS=3D6
>  CONFIG_SERIAL_8250_EXTENDED=3Dy
>  CONFIG_SERIAL_8250_ASPEED_VUART=3Dy
>  CONFIG_SERIAL_8250_SHARE_IRQ=3Dy
> +CONFIG_SERIAL_8250_DW=3Dy
>  CONFIG_SERIAL_OF_PLATFORM=3Dy
>  CONFIG_ASPEED_KCS_IPMI_BMC=3Dy
>  CONFIG_ASPEED_BT_IPMI_BMC=3Dy
> --
> 2.20.1
>
