Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9732752D98F
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 May 2022 17:56:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3vc93JWjz3035
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 May 2022 01:56:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=YfOpM0Q8;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75;
 helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=YfOpM0Q8; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3vc61hYqz2yw1
 for <linux-aspeed@lists.ozlabs.org>; Fri, 20 May 2022 01:56:38 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A5620B82520;
 Thu, 19 May 2022 15:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1A71C385AA;
 Thu, 19 May 2022 15:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1652975795;
 bh=HB0SywbMvt2xHizeVdOfaikETzpcXvZJJzSNtapX5kI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YfOpM0Q8nxBLGFQ6UzEuZ5Q7PEMclqOAQJEXU/xV4jB+EfKLN2B3x7gCUKUE6UlCg
 xiMkT+shxKPz2daPz2Mg83Xqc0P2TZjhG8Z+ZapOyQBZVS9ZjkRr+rtsoTT3F1W6Fm
 zg2MknPLGE83TKPK6c4W8D954el8Ws/p0P14EMKs=
Date: Thu, 19 May 2022 17:56:32 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Neal Liu <neal_liu@aspeedtech.com>
Subject: Re: [PATCH v3 0/3] add Aspeed udc driver for ast2600
Message-ID: <YoZosLk5GhTsP841@kroah.com>
References: <20220518062043.1075360-1-neal_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220518062043.1075360-1-neal_liu@aspeedtech.com>
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
Cc: Felipe Balbi <balbi@kernel.org>, linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Li Yang <leoyang.li@nxp.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, May 18, 2022 at 02:20:40PM +0800, Neal Liu wrote:
> This patch series aim to add Aspeed USB 2.0 Device Controller (udc)
> driver, including driver itself, device tree node and documentation.
> 
> Change since v2:
> - Rename device tree nodes.
> - Fix unusual indentation.
> 
> Change since v1:
> - Fix build test warning reported by kernel test robot.
> - Rename proper name for dt-bindings document.
> 
> *** BLURB HERE ***

No blurb?

