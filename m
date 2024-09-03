Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90ABA969E86
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Sep 2024 14:59:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wym193H8Nz2yQG
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Sep 2024 22:59:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725368379;
	cv=none; b=N4vec0EKi7xK4K3ZTX/f9LhzjFZfoDLXB+sq5QMekkEl9SGZWfnzjiPplDdzyrHqiz7ZGxLPQEj0IcqTWBKFURePM5txd9CNXOYS8EPL44sAmzQJWpy42XSaFJss6Kf1FhJABSy7fo+wgvi0nJH0W3YUYwfrsF0nTP+B7TW9hZn2bG5AlwrBtRCRSt8aec3T/rkbgDzYf/pslnkvtRyHDn+o5av7Nuv2OZe2V8hlMM0yR94OuyumrZ0ycQs1feqyJ/vOsz6ADGA2De1UkjPURTqY6WOdaDCVM/w13xEFkSYddf/oj8mUR5zS2HCXrS09nbTKFOvO3iegtI1CGFigfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725368379; c=relaxed/relaxed;
	bh=Ak4Kt5uZs3RJdF8bxOqkGiiTzG5BtB2Q/IRBISAp8gM=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=j0eN19UtZkwDksoWBpmhQniORrijDAkK/6H4lvtAx72EhtKHjfoAOo6p7F4X+dDeoJvwzmnq/dcmAeOcDH5UmMXe0YKYOkMNTZEPYTPO1xckKob/rfVaD0IVA1zF8Mla3R8vPRYJnx+Ossy1OI1/E3hvkjU63DJOttKARUPEWK52KHME6nZMi0eZzQkr7r7Ej46MbWcCSZ4h8g/fo/9H5uuMorD9tuoyPol9YmMvPUMKaCw+741W+GQaSMtogiXa/nEOVzt2ZVyPlyQOfA+/hRSamTuSiYuUH6nBkUiD04wHJbDHYrlghI7YUbm8Rg/gb9x9Db0qtFio9ap6hpOOaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=QcRJepMt; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=QcRJepMt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wym160X6Kz2xTR
	for <linux-aspeed@lists.ozlabs.org>; Tue,  3 Sep 2024 22:59:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1CD3AA43528;
	Tue,  3 Sep 2024 12:59:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78EC9C4CEC4;
	Tue,  3 Sep 2024 12:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725368373;
	bh=BAEngeHpyYeVwByip4L+Bpi9Z3pek2v9P47Zvac5BR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QcRJepMtKQrKRnONPQ/45L6oAjJgdUuT7hiHKmNR82jx9u+NEDsvxitgKi6sQeryY
	 dGR4rPV3K1b41GzcbaLoZ+m4ROf0TyYn0/4+OvX9nybA3vUOED5SjEZbMdadANGzPk
	 6akYv5wnXWgUB4+FsNG9ft4SBDOBV3sl5quz+/1c=
Date: Tue, 3 Sep 2024 14:59:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: tangbin <tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] usb: gadget: aspeed_udc: use the defined variable to
 simplify code
Message-ID: <2024090325-thud-penalty-0283@gregkh>
References: <20240903123152.6980-1-tangbin@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903123152.6980-1-tangbin@cmss.chinamobile.com>
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
Cc: linux-aspeed@lists.ozlabs.org, neal_liu@aspeedtech.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Sep 03, 2024 at 08:31:52PM +0800, tangbin wrote:
> Use the defined variable 'dev' to make the code cleaner.
> 
> Signed-off-by: tangbin <tangbin@cmss.chinamobile.com>

Please use your full name, not your email alias.

> ---
>  drivers/usb/gadget/udc/aspeed_udc.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
> index f4781e611..702d4806c 100644
> --- a/drivers/usb/gadget/udc/aspeed_udc.c
> +++ b/drivers/usb/gadget/udc/aspeed_udc.c
> @@ -1479,7 +1479,7 @@ static int ast_udc_probe(struct platform_device *pdev)
>  	struct ast_udc_dev *udc;
>  	int rc;
>  
> -	udc = devm_kzalloc(&pdev->dev, sizeof(struct ast_udc_dev), GFP_KERNEL);
> +	udc = devm_kzalloc(dev, sizeof(struct ast_udc_dev), GFP_KERNEL);

<snip>

I see the goal, but unless you have this hardware and can test this
change out, I'm going to leave it as-is as nothing should have been
changed here.

sorry,

greg k-h
