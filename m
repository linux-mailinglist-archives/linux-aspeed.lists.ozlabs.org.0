Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0B128818B
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Oct 2020 06:56:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6wkj5sg3zDqWr
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Oct 2020 15:55:57 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kroah.com (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=greg@kroah.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256
 header.s=fm2 header.b=pRhEWcT7; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Qw9W9492; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6wVK0kNDzDqW8
 for <linux-aspeed@lists.ozlabs.org>; Fri,  9 Oct 2020 15:45:11 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D97495C0182;
 Fri,  9 Oct 2020 00:45:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 09 Oct 2020 00:45:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=S4/5eZfqaYaOzO/YeHgD2mGbpT3
 lW2T47+2f0JWAWZI=; b=pRhEWcT7KllZzKtVHmHyl+gJPE/br0RSkYako5P6vqV
 xObmNDyeJYriFvPBMmERo6eCwluPvHvEDtllve8wx65XAXVnD1mYsTqZdYTZCDAV
 j6S3XqMdslU+53E6G8E3D/zz8xekZSBRGFAjPnUJ0z8irrwD9LmXcf4hLmCeo12p
 0KDK98bSXfohW2ntyfCLVrCbTw4C1xpGYHwCvOeQA4Cl/XW3tY6d6pHOse1VNH8l
 wnKN+oaWAGAqlaZxJcufmq/ej7eN4DRZfOQ+Js5MikQlmXB7w/Yh+878UAB3FIf6
 J+mrWXzL4j+bOwa7ZJNlJmDqcD4FEO6d/rBUsvFnt7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=S4/5eZ
 fqaYaOzO/YeHgD2mGbpT3lW2T47+2f0JWAWZI=; b=Qw9W9492QtF0bYh8C/s/4R
 XyOuGclsmyzEnJfbOxA+1NBMfRf26XIqFVoA7j/Bj4SJ4Swm7GLmulUase3UWIWq
 zU7snfPVp66TwSIO41hgqKz3vJP4piCL+XEgB7oM3050qxg/HJxed9yyiFValNRw
 SE1CDy7YQVyioODCN7ju0BgbRtcBA3Bs/LkNkK78IAZXN7MWbsMOeauBhKIoEwVB
 SnzIZANjw1ejztlDZYr4qEPO8QBgx5lmvfZiEx+E4Lr2zHzuKtfZ7l3SbUzi5DAW
 BWuqs5Uw4MlobSvpire6taRLJH9TBYTiBHlGYUkwiTq7iNvMEg2xI4pNH+zj53YA
 ==
X-ME-Sender: <xms:0-p_X2H4WQXCAv1Lar7i5G07Yme-8xzRZXn9G3fGPR1R5MniSflyXA>
 <xme:0-p_X3UD2HsnPoTMI3qqDa-2JUX1eaJAocU8EERIoHp-M3JJNL1c67U0h1xd_hnYH
 RnJVKSFD8gR4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrhedtgdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
 jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
 ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeekfedr
 keeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:0-p_XwLvUGtMH6SsBrNZuRCQ4l5KiyZwI9wutGi--2V3ERzsFkUpiA>
 <xmx:0-p_XwH87L6RJf--u-suOApyPDtrz29jpM2ZbQmNZ2YQqJgJbhkRcA>
 <xmx:0-p_X8X2f6DBPG46MS6ZREr_tFiMUtD9sFTJaheFgkpFX9rAubb70A>
 <xmx:1Op_X-I3Kqd4GhCOq__lCtogIVOhXuZGJB-ccQoOLkWhq0P9-0vSCg>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 by mail.messagingengine.com (Postfix) with ESMTPA id 58B903280060;
 Fri,  9 Oct 2020 00:45:07 -0400 (EDT)
Date: Fri, 9 Oct 2020 06:45:05 +0200
From: Greg KH <greg@kroah.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v2 2/3] usb: host: add uhci compatible support for
 ast2600-uhci
Message-ID: <20201009044505.GA111063@kroah.com>
References: <20200930040823.26065-4-ryan_chen@aspeedtech.com>
 <20201009024937.11246-1-ryan_chen@aspeedtech.com>
 <20201009024937.11246-3-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009024937.11246-3-ryan_chen@aspeedtech.com>
X-Mailman-Approved-At: Fri, 09 Oct 2020 15:55:47 +1100
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
Cc: bmc-sw@aspeedtech.com, linux-aspeed@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alan Stern <stern@rowland.harvard.edu>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Oct 09, 2020 at 10:49:36AM +0800, Ryan Chen wrote:
> v2:
>  - Fix continuation lines, align with "of_device"
> v1:
>  - Add support for AST2600 SOC UHCI driver.

These all go below the --- line, as the kernel documentation asks for.

> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

You have no changelog text here at all, and I can't take that, sorry.
Please fix this up and resend with a proper changelog text.

thanks,

greg k-h
