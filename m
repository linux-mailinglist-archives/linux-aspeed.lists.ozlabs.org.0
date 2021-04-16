Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C70FC3617AE
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Apr 2021 04:48:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM0yl4zyrz30hV
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Apr 2021 12:48:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=OzqwZhi1;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82d;
 helo=mail-qt1-x82d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=OzqwZhi1; dkim-atps=neutral
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM0yk03V2z2yRR
 for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Apr 2021 12:48:45 +1000 (AEST)
Received: by mail-qt1-x82d.google.com with SMTP id o2so6441951qtr.4
 for <linux-aspeed@lists.ozlabs.org>; Thu, 15 Apr 2021 19:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fRiW54V2bHrmc5p+fHyLQSdpIWhEJz43c7guQ+QVhrs=;
 b=OzqwZhi1VAlLv4XH9uNSYxD37Zew6jihz5h94kcyVKMJ78fty99JNvvYQvrY2NYlgE
 rPkuaY+zyBq6vQ16sZo6cvC1xLGJRXtWhNcEZRqEyMtG+5TU2DkFFpyzTrtshm5eTQ/j
 MarYFgHpQF4lqE2YZ+XIhTiTXcsGXNV3+mO6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fRiW54V2bHrmc5p+fHyLQSdpIWhEJz43c7guQ+QVhrs=;
 b=h/+NQzC50NxSfTD+UFm6tkdCkJ4tua31/uPTV6oL+xZqmCEio6sjzpeuN+q/sFajOK
 SUU7J8jzAhB6iZOF3K4uR899RT/M+Q442oR0kXfEhXKw9ZBVv58rjJS13q3PIILmUHAW
 36wuDOJPyT2O2tWecloPGx3DTxkrUkKU4XQcWSsKcE/d70NMqAqQK7iaPFYqgs7QXQMb
 9c7F5fuxlUHttNkt2cQUyXcsLDIItYjbIM4ry9yuqxw042KAeyQjeNcokVJxmLx+Yg4m
 0QbrJw2jVyOinjuA+2cg2ZCh9+YInqzo3RpAEPsQmpdmZ/IX0G6uXNHBcODvIiEpoZJC
 lUYQ==
X-Gm-Message-State: AOAM532C2YIjCNRPs19o304KT/RDcfGlbumAus4rvfgVy9acy2ePkXXQ
 YPZ/l0TEFkO0uoMosDvEROmPjXNHGrjUVQbyM2f+XM5a
X-Google-Smtp-Source: ABdhPJwBn/8jmP91IpVufk1jU8YJdAdeyOXx4xn0Ct0MRUnMWpOvPhOr7J6a5k0Uu0KwXlR3aWGNJXoInSIU7eQIo4M=
X-Received: by 2002:ac8:5f87:: with SMTP id j7mr5742195qta.135.1618541322415; 
 Thu, 15 Apr 2021 19:48:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210413194308.36930-1-eajames@linux.ibm.com>
 <CACPK8XcvMxsFFDvrN1ueRGwFGJ55Yp4N8vNBA9tdfaa5jqzw8A@mail.gmail.com>
In-Reply-To: <CACPK8XcvMxsFFDvrN1ueRGwFGJ55Yp4N8vNBA9tdfaa5jqzw8A@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Apr 2021 02:48:30 +0000
Message-ID: <CACPK8XfCbvibyGQyxWL7pU_nE2UOLowYVzX+fvnn7UVPxr7R4w@mail.gmail.com>
Subject: Re: [PATCH 0/4] ARM: dts: aspeed: Rainier: Various fixes and update
To: Eddie James <eajames@linux.ibm.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 16 Apr 2021 at 02:47, Joel Stanley <joel@jms.id.au> wrote:
>
> On Tue, 13 Apr 2021 at 19:43, Eddie James <eajames@linux.ibm.com> wrote:
> >
> > This series fixes a number of issues introduced in the Rainier device tree.
> > It also brings the device tree up to date with the latest hardware revision.
> >
> > Eddie James (4):
> >   ARM: dts: aspeed: Rainier: Fix PCA9552 on bus 8
> >   ARM: dts: aspeed: Rainier: Fix humidity sensor bus address
> >   ARM: dts: aspeed: Rainier 1S4U: Fix fan nodes
> >   ARM: dts: aspeed: Rainier: Update to pass 2 hardware
>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
>
> I have applied these to send to mainline.

Next time, please make sure you cc linux-arm-kernel. This way they are
archived on lore, which is how I grab the patches.
