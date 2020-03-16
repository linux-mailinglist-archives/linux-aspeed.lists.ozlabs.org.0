Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFFA186443
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Mar 2020 05:50:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48gkPj3FjvzDqP9
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Mar 2020 15:50:17 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=WCFiOpu7; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gkPb6NVSzDqLN
 for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Mar 2020 15:50:11 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id s11so12681786qks.8
 for <linux-aspeed@lists.ozlabs.org>; Sun, 15 Mar 2020 21:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uxCRLDZ0IkMQwqs0XVpLiauYQ/QOJLqTZsxTkwxRAyY=;
 b=WCFiOpu7CYhUUeWYfysTGcsR835PmVC/GV/aSKpxW+atVSjfK72AHRQ3T4uxqOHcMD
 ygmW8Xe+hhjuc+zVNNmvLKsWo6IouNiBJIMG761CPajmDfxY1qeBto+g8sv0AYq6KxZ+
 VPtUbPtKq4E14TOu92UDlrkuAF1ZyA3vQ7wFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uxCRLDZ0IkMQwqs0XVpLiauYQ/QOJLqTZsxTkwxRAyY=;
 b=cIDKX5MiFIZYIe90mH3i9K4HJp9UEqZlxMgtSpm2yzBrpXpGLwotUpH9HVGVz0dfR+
 bvpJ19IBB6DKtX1/2xTJKBKmUim9oPwD/STZYaZRVqMFP9Kkbjo6MVPBwkvFX+fTzHdl
 4YkmXpLDieP9sNRhtG5q5o6tqSVF9zP0AlMnAZyFVz7Xo1j4Lztp1dYRYhiy5qReVZDR
 DbE98gLA9JESlJvh3fE7alJ4fS5Zt6eelbeEcIBPaNZoeWzkrKbOcvbeUWQiP5GRlTCo
 VqV13EQa4BR6Fl9ATu43q+fVSzPrnfMErL6LkKKF6cGVI1/fqIlI8J27nrBCRqiE1uP9
 oA5Q==
X-Gm-Message-State: ANhLgQ2vb3tNLavmMOc6w5yW4j9F8wiPkA2NK6XBRZgyql4qViD4IMux
 d/YAfqS/zgmlpZkRMhUhCYpO3UhRna6nJeKmp6M=
X-Google-Smtp-Source: ADFU+vt9p6Gc2hMT0p448VwZq+IUNrzJ5/vgFErcVtQKm6CZXXWDuj9Qqg7E4Y9B/H+Dx2mFG0PWSWrbG2zUbsiVJco=
X-Received: by 2002:a37:6e06:: with SMTP id j6mr24529985qkc.171.1584334207132; 
 Sun, 15 Mar 2020 21:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <1579123790-6894-1-git-send-email-eajames@linux.ibm.com>
 <1579123790-6894-7-git-send-email-eajames@linux.ibm.com>
 <CAK8P3a3HsdpLz0aDGem1BrQsNo2mEJOnOsLcKFcLjaERx9dhGg@mail.gmail.com>
 <1a303336-9ffb-353f-efe3-7d45ed114fd0@linux.vnet.ibm.com>
In-Reply-To: <1a303336-9ffb-353f-efe3-7d45ed114fd0@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 16 Mar 2020 04:49:55 +0000
Message-ID: <CACPK8XcD5O0dwEOSHqWfCu38B96JkdbcvzCuJhep+PXF6foC=g@mail.gmail.com>
Subject: Re: [PATCH v6 06/12] soc: aspeed: Add XDMA Engine Driver
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Jason Cooper <jason@lakedaemon.net>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Marc Zyngier <maz@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 10 Feb 2020 at 17:10, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>
>
> On 2/10/20 10:35 AM, Arnd Bergmann wrote:
> > On Wed, Jan 15, 2020 at 10:31 PM Eddie James <eajames@linux.ibm.com> wrote:
> >> The XDMA engine embedded in the AST2500 and AST2600 SOCs performs PCI
> >> DMA operations between the SOC (acting as a BMC) and a host processor
> >> in a server.
> >>
> >> This commit adds a driver to control the XDMA engine and adds functions
> >> to initialize the hardware and memory and start DMA operations.
> >>
> >> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> > Hi Eddie,
> >
> > I'm missing the bigger picture in the description here, how does this fit into
> > the PCIe endpoint framework and the dmaengine subsystem?
>
>
> Hi,
>
> It doesn't fit into the PCIe endpoint framework. The XDMA engine
> abstracts all the PCIe details away so the BMC cannot configure any of
> the things the PCIe endpoint exposes.
>
> It also doesn't fit into the dmaengine subsystem due to the restriction
> on the ast2500 (and maybe the ast2600) that the XDMA engine can only
> access certain areas of physical memory. Also problematic would be
> pausing/resuming/terminating transfers because the XDMA engine can't do
> those things.
>
>
> >
> > Does the AST2500 show up as a PCIe device in the host, or do you just
> > inject DMAs into the host and hope that bypasses the IOMMU?
> > If it shows up as an endpoint, how does the endpoint driver link into the
> > dma driver?
>
>
> The AST2500 and AST2600 have two PCIe devices on them, so these will
> show up on the host if the BMC enables both of them. Either or both can
> also be disabled and therefore will not show up. On the host side, in
> order to receive DMA transfers, its simply a matter of registering a PCI
> device driver and allocating some coherent DMA.... Not sure about the
> details of endpoints/dma client driver?
>
>
> Hopefully this answers your questions. Thanks,

Arnd, did you have further questions about this driver?
