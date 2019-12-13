Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 091EB11DBB0
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Dec 2019 02:31:01 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YtR51TfNzDrCH
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Dec 2019 12:30:57 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="SoJQ5xHv"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="oc+XOCz9"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YtQd2Vw5zDr5V
 for <linux-aspeed@lists.ozlabs.org>; Fri, 13 Dec 2019 12:30:32 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id F2E50816;
 Thu, 12 Dec 2019 20:30:28 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 12 Dec 2019 20:30:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=kIQjHdVLE1/fU9KLKVqg1kUSU55z6qa
 RkOCmaNZ7BcM=; b=SoJQ5xHvi3TecnC2YnRQVyS8fHZ9HwNhk6t6bDtxOvFj1fa
 4xH0M+JjI6BGsABRedlcfWLu2SPCvrLL9bYFLYlSfxVDrsW1RJRUu5kgGtx94b2E
 q8OCbmI3eCk+HtRHALdZOuzKWmN0wq6cHb31AFq0OGxCwuAUCrwH3EKEFEGpm8Ax
 jgpQdNCj1s2wXnx/hl5JyjwihPnxmNDbsBPcqOgYdo8RvleY4PB6jdLbREFFmfN9
 wmzCrFFygtUhv+6CW6PChNfIoHYMCNAwe8QF5blsXjZuvHDBrqDnT4c/A19XTolg
 dT4JR1PxTvDMXZWNVTv+qWsnOtC7IknaaLhp6ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=kIQjHd
 VLE1/fU9KLKVqg1kUSU55z6qaRkOCmaNZ7BcM=; b=oc+XOCz9hlr/DOd2zlvukv
 U0Licj/xRjpzT8oaccVAWiWCQ23NZ4jGRvhiXRZUvdwWVEXxd0QDYUjVenh6vj/7
 nup1Tmp/yTzFenX7zuuMPOnqpcetaGGPwcVmMaDGScTtscKOmCYqInqTNZqP2zfh
 rF7TgQH7JVNr3tlGprHOVfSzYiRQSizIF9Cm9GHXU4pHvN+KjDn9cKrLgddLxGUR
 8aRgJngKLJhwtLH663kKAJr7cQokmq/kqazL7u9fVv2o9w/RCq8wMP/fZ7E0w6wr
 9CA4ocXRyJA3LYQa6mFprFUbgQR85GZBKI+T+EZ5ejajuTUeAbMUMC/ZiHFFS/Bg
 ==
X-ME-Sender: <xms:sunyXdExu8xTM5B38nRS1bCN5Z15PXqo3hXfKkXXe8AmYeN05gt4qQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelkedgfeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:sunyXXcSxg4dgH-B0kWwKeSVBRadjgvRAPWCagmcKt0fLHcBk4_sLA>
 <xmx:sunyXWbQUcYVk3SvFPvRGO6bqpOqNezIuw_MW1-fAUvsiwUUVEbh0g>
 <xmx:sunyXapAx4F9qjVqSOiMKR330kZAcK0jxMIHppW06AwZZd0dudQzwA>
 <xmx:tOnyXSu_o_4JZC6f6T3E_sP3_KtRV98RBlold90e-Z-jZKy2_kiNug>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 34C75E00A2; Thu, 12 Dec 2019 20:30:26 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-680-g58d4e90-fmstable-20191213v1
Mime-Version: 1.0
Message-Id: <274285bd-1304-4e35-945a-90c9aecd119b@www.fastmail.com>
In-Reply-To: <20191213000657.931618-5-dima@arista.com>
References: <20191213000657.931618-1-dima@arista.com>
 <20191213000657.931618-5-dima@arista.com>
Date: Fri, 13 Dec 2019 12:02:05 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Dmitry Safonov" <dima@arista.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/58] tty/serial: Migrate aspeed_vuart to use has_sysrq
Content-Type: text/plain
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
Cc: Vasiliy Khoruzhick <vasilykh@arista.com>, linux-aspeed@lists.ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Safonov <0x7f454c46@gmail.com>, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>



On Fri, 13 Dec 2019, at 10:36, Dmitry Safonov wrote:
> The SUPPORT_SYSRQ ifdeffery is not nice as:
> - May create misunderstanding about sizeof(struct uart_port) between
>   different objects
> - Prevents moving functions from serial_core.h
> - Reduces readability (well, it's ifdeffery - it's hard to follow)
> 
> In order to remove SUPPORT_SYSRQ, has_sysrq variable has been added.
> Initialise it in driver's probe and remove ifdeffery.
> 
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-aspeed@lists.ozlabs.org
> Signed-off-by: Dmitry Safonov <dima@arista.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
