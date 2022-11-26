Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3776E639780
	for <lists+linux-aspeed@lfdr.de>; Sat, 26 Nov 2022 19:04:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKKPb04fdz3f3C
	for <lists+linux-aspeed@lfdr.de>; Sun, 27 Nov 2022 05:04:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=RsUsqCrS;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=RsUsqCrS;
	dkim-atps=neutral
X-Greylist: delayed 2318 seconds by postgrey-1.36 at boromir; Sun, 27 Nov 2022 05:04:26 AEDT
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKKPQ2WzSz3c5D;
	Sun, 27 Nov 2022 05:04:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=oc2TrEmr5KqotgSvg9398nOl+D8T+97lMY4B5EaEzvg=; b=RsUsqCrSLnBVxNF9DQ50ZHA+TD
	uyJHRNxVAfcSDagZmeWTjuRD2W89a2yGOzAipRYzO8zJWN9QO1nr+6qik3SPp1ehavIBrd8WpTu5p
	P2e4qwAHk/YWthWNz063iq0BfeC1Fwhz2o5G0iTLUXK+Ajq7/NR9Fdc6Jvtxsqwl8VsI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1oyyvL-003WXJ-L6; Sat, 26 Nov 2022 18:25:07 +0100
Date: Sat, 26 Nov 2022 18:25:07 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: Re: [PATCH v2] media: aspeed: Fix return value check in
 aspeed_video_debugfs_create()
Message-ID: <Y4JL89BCcs1pjWZZ@lunn.ch>
References: <20221126022813.57372-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221126022813.57372-1-zhengyongjun3@huawei.com>
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sat, Nov 26, 2022 at 02:28:13AM +0000, Zheng Yongjun wrote:
> In case of error, the function debugfs_create_file() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check
> should be replaced with IS_ERR().
> 
> Fixes: 52fed10ad756 ("media: aspeed: add debugfs")
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

Please see:

https://patchwork.kernel.org/project/linux-wireless/patch/20200429101526.GA2094124@kroah.com/

and there are other examples. Just delete all the checks.

	Andrew
