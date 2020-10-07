Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC84285E11
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Oct 2020 13:25:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5sTB63jMzDqN1
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Oct 2020 22:25:34 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=BNoPeube; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5sSy0HPFzDqFB
 for <linux-aspeed@lists.ozlabs.org>; Wed,  7 Oct 2020 22:25:21 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id s47so1432687qth.4
 for <linux-aspeed@lists.ozlabs.org>; Wed, 07 Oct 2020 04:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yvxFh2lVt/f6BDA0Bx2JmAxB4jOtm8Py2fAMvv0foaM=;
 b=BNoPeubeS3sXBJjI0gkWLOl9TtnB7QMuencLyKdA/jOtb/IGQdLGC84nEomR3w4lx7
 9r0tdf5A85QFnljIjVksg0KJQXlffVvm4hvkE64oEtwYPmJVREvvbhBtreKXlRjgdMSj
 I6sjoizv2hosGo4CNIasokE9hpsVi7mI5ExW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yvxFh2lVt/f6BDA0Bx2JmAxB4jOtm8Py2fAMvv0foaM=;
 b=IcDABoQdVlEPAbMzawy05oiAxOnqHPeiSGsDk8R9dYu+Z1HU18DGOFb7lTt/oRm0E1
 AkoPmtUMIEObae8syt2ltCHus+d/cF7DJxp6+UcKef7ZCAJGg9E1lfoGflZyJLZJSXLm
 HeijSKwlqYIIWrdbJi36XNAuaaIQ/4OKftfcTwWHxef0z8DV8W3aNG/rf5Fxpzt/SJTw
 dMTR+ey0llIAm2zSa/P5iEvuRum7c+JsTr4dBOEFPfvumqvq9k34gh04ONxrxrxmHxoQ
 bj3RgB7x9YBV/gO4+RQAPcmOPnGYvosvqnHRqRQMDh3xlDdLrkbvM7kjnGJebckLNpF0
 3NVA==
X-Gm-Message-State: AOAM533L8+upasAA48oslbWzGiOi7gXdDk/WxXa0ShUmvHR4aYpsKaRU
 LiMAhfXIsuTJlZUFB9xTPoT/9RaZIUmlNqzE8FQ=
X-Google-Smtp-Source: ABdhPJwRYZfAQA9D02ndfJ8Hwo5EMEXHSivMoq36Tr5vogI302Zi7/RH2rzq66EfzaFRDq87koLxojb4z3VA3ooIm/g=
X-Received: by 2002:ac8:48ca:: with SMTP id l10mr2586401qtr.385.1602069916742; 
 Wed, 07 Oct 2020 04:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200930040823.26065-1-ryan_chen@aspeedtech.com>
 <20200930040823.26065-3-ryan_chen@aspeedtech.com>
In-Reply-To: <20200930040823.26065-3-ryan_chen@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 7 Oct 2020 11:25:04 +0000
Message-ID: <CACPK8Xc2Y1njgtrtjO1bdmkcQR7jDu+oaOBc3R+CWtn+UrEOhQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] usb: host: add uhci compatible support for
 ast2600-uhci
To: Ryan Chen <ryan_chen@aspeedtech.com>,
 Alan Stern <stern@rowland.harvard.edu>
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
> Add support for AST2600 SOC UHCI driver.
>
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

USB maintainers, can you please take this patch (2/3)? I will take the
others in this series through the aspeed tree.

Cheers,

Joel


> ---
>  drivers/usb/host/uhci-platform.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/host/uhci-platform.c b/drivers/usb/host/uhci-platform.c
> index 70dbd95c3f06..fa40fe125c2a 100644
> --- a/drivers/usb/host/uhci-platform.c
> +++ b/drivers/usb/host/uhci-platform.c
> @@ -113,7 +113,8 @@ static int uhci_hcd_platform_probe(struct platform_device *pdev)
>                                 num_ports);
>                 }
>                 if (of_device_is_compatible(np, "aspeed,ast2400-uhci") ||
> -                   of_device_is_compatible(np, "aspeed,ast2500-uhci")) {
> +                       of_device_is_compatible(np, "aspeed,ast2500-uhci") ||
> +                       of_device_is_compatible(np, "aspeed,ast2600-uhci")) {
>                         uhci->is_aspeed = 1;
>                         dev_info(&pdev->dev,
>                                  "Enabled Aspeed implementation workarounds\n");
> --
> 2.17.1
>
