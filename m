Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F55A2EF274
	for <lists+linux-aspeed@lfdr.de>; Fri,  8 Jan 2021 13:21:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DC2KD4Ck3zDqDW
	for <lists+linux-aspeed@lfdr.de>; Fri,  8 Jan 2021 23:21:52 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=balbi@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MLryRnKH; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DC2Jd455fzDqCl
 for <linux-aspeed@lists.ozlabs.org>; Fri,  8 Jan 2021 23:21:21 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 93195238E4;
 Fri,  8 Jan 2021 12:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610108478;
 bh=CGyJVGRnQUYO+Dwo4ILDxEFobjgiAm4vANZ35SFjRV4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=MLryRnKHypOReQqOXqkOcMYCuhbGUcwnL3G7NGpCrsl4eVIPM5AisIPpGId1oC5a0
 3QmasNX/oubX4G5K3RnPBJialUK24gquHFumpY54G63J7pj1N+0hskyCQJ6K8cv8sn
 aIQrBdsYmZIVbGsRT4tIF71fu/aFVO46XJXVC7lO2omH6DsxMLPVbNcy9G2YyHY3og
 8C2ZQaeZdLndkK5MKaSIIiyVoZ5vpdn4J3yLip7fTbL0iDRdptJoiXneLEOS2qf67P
 fIrvcHFdrEc2xgMTl1JVMv1Z1n4o0dAdBbtp17/XAUS42b2DP4lT2NmqpbXO9/tyjl
 6/UwelUa18wNA==
From: Felipe Balbi <balbi@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>, BMC-SW@aspeedtech.com, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] usb: gadget: aspeed: fix stop dma register setting.
In-Reply-To: <20210108081238.10199-2-ryan_chen@aspeedtech.com>
References: <20210108081238.10199-1-ryan_chen@aspeedtech.com>
 <20210108081238.10199-2-ryan_chen@aspeedtech.com>
Date: Fri, 08 Jan 2021 14:21:14 +0200
Message-ID: <87h7nrwret.fsf@kernel.org>
MIME-Version: 1.0
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


Hi,

Ryan Chen <ryan_chen@aspeedtech.com> writes:
> The vhub engine has two dma mode, one is descriptor list, another
> is single stage DMA. Each mode has different stop register setting.
> Descriptor list operation (bit2) : 0 disable reset, 1: enable reset
> Single mode operation (bit0) : 0 : disable, 1: enable
>
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

I don't have HW, but FWIW:

Acked-by: Felipe Balbi <balbi@kernel.org>

-- 
balbi
