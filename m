Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE43285E0C
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Oct 2020 13:23:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5sQN6HLtzDqNP
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Oct 2020 22:23:08 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f44;
 helo=mail-qv1-xf44.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=V4ewLRuS; dkim-atps=neutral
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5sQH1DPpzDqFB
 for <linux-aspeed@lists.ozlabs.org>; Wed,  7 Oct 2020 22:22:57 +1100 (AEDT)
Received: by mail-qv1-xf44.google.com with SMTP id s17so876133qvr.11
 for <linux-aspeed@lists.ozlabs.org>; Wed, 07 Oct 2020 04:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VDZ7366PYXV+EES+h1SP5kqwgNb+8wXHAp/x+TfkHHQ=;
 b=V4ewLRuSp54/Es30G+9lHydPGsIBHA/iBPNIIFC6wqeHjmE+cKVoD2hVaFWbdOjWLk
 ArfNdh0xsJdlKSi8t+YbszArS+osss156prcP2g6lNyME0srRiGPuyE2+ytEXTRrAlLq
 hMWDB7UsNJMXpmaNx5oGxvmksdmRwpWkv65Iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VDZ7366PYXV+EES+h1SP5kqwgNb+8wXHAp/x+TfkHHQ=;
 b=AH0rYUjfxxPQSA+gR2J7vE2xOiRf+SlZTcri+ibgpQQmB7g86kV57odNX5v6CUH4Yb
 +WWPBkrvO+V3tWIm59QMitjIYCzlU8IrZXpgKd2/tDDlhar2FsnbU1iWvk1Q/+IFySER
 nHJkcu4tgy/gf4ZICRKKez1XH7uR3+97YrKnugJBWglhg2MESjgUCCsHrodiJKNC5nTD
 mwJdCPDglML0xhkWqJvYZMU2ONsHMBs2Ygss8y/iqiQbZ4c5NNax/CJzcEeiZ4YLsXPS
 2fU3z1w4n4fYAa/QW8PONIRO+Ll6q32ZtS2G2K4dqYTUtUV+o0wgMun37tRTEcjC30xc
 fTow==
X-Gm-Message-State: AOAM5316jzBuZRxF3QxzXsTw4caxppfBzpEdBZZtSf4dlNCAIjgpN2Xi
 fwRf0ac5PyZIWAKvIEBBRPB9FqBuFXPyr9skBcVkGcjJ5A4=
X-Google-Smtp-Source: ABdhPJzKVQdBmFZCKKWSEm97o3B7rUKLuxjDE9PQwX6qhes4HRH5nA7bRHEpXLl2xuSjOCJ4fc5lYvanqO7avGGYxDI=
X-Received: by 2002:a05:6214:11e4:: with SMTP id
 e4mr2447677qvu.61.1602069773219; 
 Wed, 07 Oct 2020 04:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200930040823.26065-1-ryan_chen@aspeedtech.com>
 <20200930040823.26065-2-ryan_chen@aspeedtech.com>
In-Reply-To: <20200930040823.26065-2-ryan_chen@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 7 Oct 2020 11:22:41 +0000
Message-ID: <CACPK8XfBQgFk8oCaN_YAoKrvmV7QaOTFrHCWcjpEQv3bbjm70w@mail.gmail.com>
Subject: Re: [PATCH 1/3] configs: aspeed: enable UHCI driver in defconfig
To: Ryan Chen <ryan_chen@aspeedtech.com>
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
Cc: bmc-sw@aspeedtech.com, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 linux-usb@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 30 Sep 2020 at 04:08, Ryan Chen <ryan_chen@aspeedtech.com> wrote:
>
> Enable UHCI driver in aspeed_g5_defconfig.
>
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

Reviewed-by: Joel Stanley <Joel@jms.id.au>

> ---
>  arch/arm/configs/aspeed_g5_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
> index 2bacd8c90f4b..a57009d1a3b8 100644
> --- a/arch/arm/configs/aspeed_g5_defconfig
> +++ b/arch/arm/configs/aspeed_g5_defconfig
> @@ -212,6 +212,7 @@ CONFIG_USB_DYNAMIC_MINORS=y
>  CONFIG_USB_EHCI_HCD=y
>  CONFIG_USB_EHCI_ROOT_HUB_TT=y
>  CONFIG_USB_EHCI_HCD_PLATFORM=y
> +CONFIG_USB_UHCI_HCD=y
>  CONFIG_USB_GADGET=y
>  CONFIG_USB_ASPEED_VHUB=y
>  CONFIG_USB_CONFIGFS=y
> --
> 2.17.1
>
