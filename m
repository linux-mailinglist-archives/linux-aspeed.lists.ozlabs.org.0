Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E6F500D1E
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 Apr 2022 14:22:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KfJW91fkpz3096
	for <lists+linux-aspeed@lfdr.de>; Thu, 14 Apr 2022 22:22:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N8vF0SYd;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=N8vF0SYd; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KfJW554Xmz2yK2
 for <linux-aspeed@lists.ozlabs.org>; Thu, 14 Apr 2022 22:22:25 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A8A6D61F63;
 Thu, 14 Apr 2022 12:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 951F1C385A1;
 Thu, 14 Apr 2022 12:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649938942;
 bh=8Xnx1DikNC8S2miol9o95pX0WhJ5fuI422FUZIL5zhg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=N8vF0SYdpsOHP/kq1h8sVjrcKPvnImlfhaeWieGFCt9WQNoz+/pC8GVsQ7LgHgwx6
 bahUHfWLmPARFdsuDbP75vQxEYigTxwlYRfHpEfDMYnB5Cx7Icft0fLLLON1CH1Eui
 eaGX/bXDgdmvvEpOs23AYeh1DMgsk7QIC3pCWMkpRwZq8O1yp3sV7SYHEfctNv9b44
 nM5uBbKrIJQx6Vh3VQa44flG/cxsz7Cve7gu9W9pAufjz96fBQfw0riFR/yLYfstWQ
 BU97D2C6ww4KepktXtYrxxSqFqh6HcU1zWTTDK3mdHuzV1O3Tt2i/GZagEIBwPIN5i
 05vzYceWGgdgQ==
Date: Thu, 14 Apr 2022 14:22:12 +0200
From: Jakub Kicinski <kuba@kernel.org>
To: Dylan Hung <dylan_hung@aspeedtech.com>
Subject: Re: [PATCH v5 0/3] Add reset deassertion for Aspeed MDIO
Message-ID: <20220414142212.258fcb37@kernel.org>
In-Reply-To: <20220413121037.23748-1-dylan_hung@aspeedtech.com>
References: <20220413121037.23748-1-dylan_hung@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: andrew@lunn.ch, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, p.zabel@pengutronix.de, BMC-SW@aspeedtech.com,
 krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 13 Apr 2022 20:10:34 +0800 Dylan Hung wrote:
> Add missing reset deassertion for Aspeed MDIO bus controller. The reset
> is asserted by the hardware when power-on so the driver only needs to
> deassert it. To be able to work with the old DT blobs, the reset is
> optional since it may be deasserted by the bootloader or the previous
> kernel.

I presume you want this applied to net-next, but it appears there 
is a conflict or something. Could you resend the patches based on
net-next/master?
