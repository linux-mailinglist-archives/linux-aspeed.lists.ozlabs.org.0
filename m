Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4953B28818A
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Oct 2020 06:55:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6wkb0gP6zDqWt
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Oct 2020 15:55:51 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Pc8bU3ok; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6wkL5QpzzDqWW
 for <linux-aspeed@lists.ozlabs.org>; Fri,  9 Oct 2020 15:55:34 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id c23so7094115qtp.0
 for <linux-aspeed@lists.ozlabs.org>; Thu, 08 Oct 2020 21:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JITYELoE/qFaD4z4UN02Zx69cGQiMW1pde3kjV+K9t4=;
 b=Pc8bU3okyDdFxjoMwcb2vkJ3OzZeQyWBhPNwH8Wklu6kofGksdY4leew1nB1ILwV6T
 x3GuSqNpsq5skpjUxuHacbAi8/nnxIiPrgkzSpCP03h8t64maLiv/yGQhyn6ELZHN1VN
 NaXX8oYBTiJ9MbCkHgTFS4VDzEEw3Rbz8eXzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JITYELoE/qFaD4z4UN02Zx69cGQiMW1pde3kjV+K9t4=;
 b=G+9JDLARCttk/qiN1D2T1DDCTk0FdEyoggvSYzn/qX06HvCFIEYRTKdbUBPtaAOeMf
 ZlINR3KWxWH3s1w+QVzP7WZxDNhls6ZlN3l9P5VeGo7VE79OtndKGPflCukyjmN9X7av
 Evj7riNPilvazyuLTFYN8xKjbKU6R2KdmFc2kpcVvyNkV3dsHlpspCWqonsR0O4/q6cv
 9Ct6X8EnJkpM2YCpBKkb6QHZh5tnpDV90Pb5HEU/uaXR1R2Ph8bL3m4Z+xi3aHeUUDBG
 l/ik+ys5U/Eu7+qG9qZXBdJ/DDRo0D68QAwM+c4w1PchMbBQ93r7m2jQD4wR7x1YVNXC
 B51w==
X-Gm-Message-State: AOAM531CRnaeyegUu8cn4KPrrNquh1v6BjGS+cV8dA2GiazqwgOYGqIl
 qAUDaEljYcMjR0CHl0G6MswafKkLUizKQBGiE/8=
X-Google-Smtp-Source: ABdhPJxweXKi0eYYK2fikbnQTeaqtnzyH0KIKjWAIAVeiXcYUH20dQdSYyQgZJo5tRaOmVwtVXVZSok4p22pYSq8f4Q=
X-Received: by 2002:ac8:2612:: with SMTP id u18mr12611002qtu.363.1602219332099; 
 Thu, 08 Oct 2020 21:55:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200930040823.26065-4-ryan_chen@aspeedtech.com>
 <20201009024937.11246-1-ryan_chen@aspeedtech.com>
 <20201009024937.11246-2-ryan_chen@aspeedtech.com>
 <20201009044526.GB111063@kroah.com>
In-Reply-To: <20201009044526.GB111063@kroah.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Oct 2020 04:55:19 +0000
Message-ID: <CACPK8Xd0h_2yGeyOjrpqV2_X8f4stZA_ur72b4Y4Nx91GrbXag@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] configs: aspeed: enable UHCI driver in defconfig
To: Greg KH <greg@kroah.com>
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
Cc: BMC-SW <bmc-sw@aspeedtech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, linux-usb@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 9 Oct 2020 at 04:45, Greg KH <greg@kroah.com> wrote:
>
> On Fri, Oct 09, 2020 at 10:49:35AM +0800, Ryan Chen wrote:
> > v2:
> >  -Changed : Add SCSI, BLK_DEV_SD, USB_STORAGE support.
> > v1:
> >  -Enable UHCI driver in aspeed_g5_defconfig.
> >
> > Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
>
> Why do you need this in a defconfig?

I would prefer configurations that are being used to be present in the
defconfig so we can test it. I think this is a sensible change.

Ryan, I gave you my Reviewed-by for the last version of the patch. As
you did not change the contents of this patch it is fine for you to
leave my Reviewed-by on it.

Cheers,

Joel
