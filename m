Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D60DD95EA29
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2024 09:15:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WshlC22GZz2yHs
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Aug 2024 17:15:03 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724656501;
	cv=none; b=ZMOaOfrBrsyddUpYSgd4FOYa4AABv9Fj6gtVfglORmuA6QV7FaRVj7P7CiTlKgOH7rI1bgfFmNTm7B1wz6yZTAHcrOV2b04+RslgTfJkVDgYTawsHqmUHIfdOJ1KWgEPtwzu1S44amc7SRtQQN9InH8JPhP2uuOl1r5iAPC4grxHIhnrbKoQ3Mv/OHi5gLxMjA3G2QFIIYFREaPZZLdgewf/tgcPIyDbr21kb6jM1Fo3tV3Q6OM745l9OaSP1yIw7mZCVnMRBQBVgKPMcRW6HuPl6aUSTbvNkWiS6IW/26PqD1GUo6cdyir0QqWBOFZv9u6trEbmKa2U4fne5MJLEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724656501; c=relaxed/relaxed;
	bh=b92oxR4FRN1QyPqUKncYuiqpCC8o3cAArslA4ZSb3DQ=;
	h=Received:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=lPfKyqPfmVl4Ysrfh49vp6Rixc/a94au1TyPWY2UL/U+B4JcLMYmefWYBRTtry5Knvhe9IFycNs5fTrLV2nyMdLQGVBkcu/hQH0ImIZSXj1Dp74HUxFnu+W1xhaa2rzZEQrwAq/inurLGi5besLQBD8FbXma6u/dg0ubLG7gHIi6M/DqoPnHexp8hmVkWMgBgKfwzVUbLeRsx9Mfj2O1qgchobZD6bCv7XSuPDn4sViDyitl5iRohhkYB8BhSUyrJI0t66C1Qk05MhF/lBprwbqP/498LxkMY8RMrA9RDzGezmJ63rcBdPUAb+5Tu6bd89gumFsSR0+6qRR0PXbGQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=wmetVni3; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=wmetVni3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wshl84wcyz2xKd
	for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Aug 2024 17:14:59 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D2DF6A41382;
	Mon, 26 Aug 2024 07:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D350BC8CDC4;
	Mon, 26 Aug 2024 07:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1724656497;
	bh=5BefvIr/PUt8DwHXKIJx2BOdAE6F9zDv394OpNPF09Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wmetVni3AbNIihEBPks0uvPVPpkKIqa1TSUhn3Ken93TpqWKBKSYzaFWsv4ID2bW0
	 XShVTZWSVqKIWmVysFjorOt9ICVHSrhJyhDzxKAkvE7q2szVWXdgtd26nz0/e8h+NS
	 IjwEUCVMSFrQyUiphvXB/eAVexAsiqKeysUHwmKc=
Date: Mon, 26 Aug 2024 09:14:54 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lei Liu <liulei.rjpt@vivo.com>
Subject: Re: [PATCH v2 0/5] usb drivers use devm_clk_get_enabled() helpers
Message-ID: <2024082621-mortuary-gazing-20b5@gregkh>
References: <20240826070244.1835-1-liulei.rjpt@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826070244.1835-1-liulei.rjpt@vivo.com>
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
Cc: linux-arm-kernel@lists.infradead.org, opensource.kernel@vivo.com, linux-aspeed@lists.ozlabs.org, Daire McNamara <daire.mcnamara@microchip.com>, Neal Liu <neal_liu@aspeedtech.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, linux-riscv@lists.infradead.org, Robert Jarzmik <robert.jarzmik@free.fr>, Bin Liu <b-liu@ti.com>, Daniel Mack <daniel@zonque.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Aug 26, 2024 at 03:02:38PM +0800, Lei Liu wrote:
> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code and avoids calls to clk_disable_unprepare().

Your email threading is broken for some reason :(

Please fix up and send a v3 series.

thanks,

greg k-h
