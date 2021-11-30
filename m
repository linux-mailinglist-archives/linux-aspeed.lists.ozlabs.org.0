Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9476463361
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Nov 2021 12:52:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3LDZ4jJJz3bgl
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Nov 2021 22:52:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=JVgPQwhB;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=JVgPQwhB; 
 dkim-atps=neutral
X-Greylist: delayed 582 seconds by postgrey-1.36 at boromir;
 Tue, 30 Nov 2021 22:52:07 AEDT
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3LDR5Kfrz30GN
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Nov 2021 22:52:06 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EE413B81846;
 Tue, 30 Nov 2021 11:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E450FC53FC7;
 Tue, 30 Nov 2021 11:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1638272536;
 bh=1fo5SlI+JcFkyn8y9UYJZhdMEAS3/IN2zErDxlT3R6Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JVgPQwhB+RvX54u6XOyxcbwWihfw2yPIBfCR1wkOqBVwJrIqQdMBlfRao4594Ojk/
 acG2BOBJXnlIQTf+InAKvIq5l3v6Lvl6ElahcEYhKngk4sEli8Qi6eWI9tZYgT6zb3
 Ub88TzfjZAzb8QAG8oaVWcxbrv/mIGvg3N/rtFSA=
Date: Tue, 30 Nov 2021 12:42:13 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Neal Liu <neal_liu@aspeedtech.com>
Subject: Re: [PATCH v2 0/4] Refactor Aspeed USB vhub driver
Message-ID: <YaYOFTmLLUJpPug1@kroah.com>
References: <20211130113847.1405873-1-neal_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211130113847.1405873-1-neal_liu@aspeedtech.com>
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
Cc: Sasha Levin <sashal@kernel.org>, Felipe Balbi <balbi@kernel.org>,
 kernel test robot <lkp@intel.com>, linux-aspeed@lists.ozlabs.org,
 BMC-SW@aspeedtech.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Julia Lawall <julia.lawall@inria.fr>, Cai Huoqing <caihuoqing@baidu.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Nov 30, 2021 at 07:38:43PM +0800, Neal Liu wrote:
> +Ben.
> ---
> 
> These patch series include 2 parts. One is adding more features
> to pass USB30CV compliance test, the other is fixing hw issues.
> More detail descriptions are included below patchsets.
> 
> Change since v1:
> - Remove unnecessary configs for SET_CONFIGURATION.
> - Separate supporting test mode to new patch.
> 
> *** BLURB HERE ***

No blurb?
