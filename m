Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C164652B73
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Dec 2022 03:26:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NcHQ0098yz3bVs
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Dec 2022 13:26:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=K9QYLOLd;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=yulei.sh@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=K9QYLOLd;
	dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NcHPt1McFz2xjr
	for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Dec 2022 13:26:40 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id f9so9534758pgf.7
        for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Dec 2022 18:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z13W3xH1nsTvhWnmTXNul5f6es8IjrbA1O/Wf7PIKNI=;
        b=K9QYLOLdztcSsTqUl7QGaammCGHwhV6GDinc1PhhBdLobE/lTqf4Fbdiwti5iLSzDU
         MvGjre3X845BtKnSxgc5U7Bm/GsqqtDeunyDlPhk7+e3YSLu9dJU8GSaHmwaYDRl3PRB
         Q5dwbjfO/M3FGw0Mb21FzIzbufJZnsSb8ztlcBEjBLTwHY6NebUCmTE00bMVGfnQBu92
         6vI2SJD2SPJPzdBDY6Pbo+vDulW6IVbqRVh+HCXvOi0z8DzwouI9DLFchH/1PRapBNRM
         BLevifdSiRso2c17qIyHaLjzlwIULRIhEka7O9uub0NAXMh9PRZSmZTUaJ20YWZ9PvwD
         GD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z13W3xH1nsTvhWnmTXNul5f6es8IjrbA1O/Wf7PIKNI=;
        b=IbNz0abSve14DWyIn1G/+JLnQGPyohXBRQajTbgaJF1s6biQdM735jR+eRGGdZEvsQ
         fW28PQFhNXQoKyctk2N1pZ3yJ3TR81rPkUAbZ332b/ZSjPBn+Ca5XHhgfT3oJDb7CXT+
         +LlWA7s22oB6PNCxJdJn6t4kJW2tAgXvY6PsIl6yGlGKphzroM8/2rLiOJhoisAisnvQ
         U6TGY8X6+8jTeCX/bswSMXdd7DNHUbJ17AGPXhtanUFiCvuIJ0qy/JR4aEdEkY8vTRcN
         5zf2ACw/jvF0aEqVbsQC/KW9syaLTSsBZDdBZJolV5esY/TjHPZhu2swux+WSBWgnW9w
         nqmA==
X-Gm-Message-State: ANoB5pmqvHClOerujOe1PFglt1Sfz1YiATKYbwbkUjm4Zfv3/+UJG0v9
	kPRjcRPKkLaM7JazXcKeEa7ef0KwdsACSYOiMY4OKQ==
X-Google-Smtp-Source: AA0mqf5V/yx0Q8zO5dmug5Y1jw5YLRIhuVHHnHGhsTq9FbPhZwCtCA9tlOs289stSkFMYCoFkO/pg3WzcUnpiib76WU=
X-Received: by 2002:a63:3641:0:b0:478:e542:7d77 with SMTP id
 d62-20020a633641000000b00478e5427d77mr11878033pga.101.1671589596254; Tue, 20
 Dec 2022 18:26:36 -0800 (PST)
MIME-Version: 1.0
References: <20221024094853.2877441-1-yulei.sh@bytedance.com>
 <HK0PR06MB32022348EA65805C7109B7D080329@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <CAGm54UExHOBw61DJNqxvW67OSr60fQ+Q247t63RzymiMOmHmFg@mail.gmail.com>
 <HK0PR06MB320203EF8E3AD14C34359B0580329@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <Y1ueEYJk2epT/g4J@kroah.com> <HK0PR06MB32024F58191E17DC5ABC99F380329@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <Y1uyssu84kl1INSR@kroah.com> <CAGm54UGmp=kTKGLhEfENF4SqkvRt_GcpuGH_g5PjtQiBkwtOsA@mail.gmail.com>
 <TY2PR06MB321303972156248AB08CAB2480EB9@TY2PR06MB3213.apcprd06.prod.outlook.com>
In-Reply-To: <TY2PR06MB321303972156248AB08CAB2480EB9@TY2PR06MB3213.apcprd06.prod.outlook.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Wed, 21 Dec 2022 10:26:25 +0800
Message-ID: <CAGm54UHWhRQsvaBQM7mgfP2A5os=mYDTfKS9qfS0C5_9XkcrSA@mail.gmail.com>
Subject: RE: [PATCH] usb: gadget: aspeed: fix buffer overflow
To: Neal Liu <neal_liu@aspeedtech.com>
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
Cc: Felipe Balbi <balbi@kernel.org>, Henry Tian <tianxiaofeng@bytedance.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jakob Koschel <jakobkoschel@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Dec 21, 2022 at 10:17 AM Neal Liu <neal_liu@aspeedtech.com> wrote:
> > > > > > Using rndis is able to set MTU to 2000, and the issue can be
> > reproduced.
> >
> > USB ecm is also tested and it is possible to set MTU to 2000, and could
> > reproduce the issue.
> > So I think this patch is needed anyway.
> >
> > @Neal Liu Could you kindly help to verify the USB ECM case?
>
> How to set MTU to 2000 on USB ECM case? I remember last time I cannot set by using "ifconfig ..."
> Regardless ECM or RNDIS, I agree this patch is still needed.

You were able to set MTU to 2000 for RNDIS but not for NCM.
@Greg Kroah-Hartman indicated that RNDIS should not be used anymore.
So I tested ECM and verified it could set MTU 2000 and the issue could
be reproduced.
