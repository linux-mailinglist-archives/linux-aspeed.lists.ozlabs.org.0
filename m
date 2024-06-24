Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7935913F9A
	for <lists+linux-aspeed@lfdr.de>; Mon, 24 Jun 2024 02:52:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=meGrzdiu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W6qF55bBYz3cV1
	for <lists+linux-aspeed@lfdr.de>; Mon, 24 Jun 2024 10:52:41 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=meGrzdiu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W6qF10gmMz30Tx
	for <linux-aspeed@lists.ozlabs.org>; Mon, 24 Jun 2024 10:52:37 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-79-194.adl-adc-lon-bras32.tpg.internode.on.net [118.210.79.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8D5012009F;
	Mon, 24 Jun 2024 08:52:34 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1719190357;
	bh=NQqL7DsqxZzghaWKR/8rkG8Pl+N6DaWnsqVc3zJk2M0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=meGrzdiu/WAEEFAf5g1Gp251Pa8oZo7y56P+pBNGGYEQSlGxKyJJzf4Ft5MxIPlTL
	 56x9n73PsCInkrlWhxqfVp80Zstmo8KnP5PhseWejB7r9NUrgWxP4wFLm9d5j7fFNm
	 ZFIq+PeRz/h4T8C5QhdglMBfj6Hp9W2+on0+14vfcItCCLGOTIAHiPF1pA3JKfKmWW
	 0bwI5xL0INEg+H+mV/YGGS3Em/HWBF/ZKylB9YkjHp5GJLWpxlt+INFsk8ttNzvbnt
	 2XSdB1LCrcEC2+yLkX3bhU08x6JZ1TqMrdv+62TALyj+TmzAKNfvENO0vx/kiZWB0A
	 P+qptu4/hC2XQ==
Message-ID: <f31f59cc4381a41c57b94d10560ec2a7356f8868.camel@codeconstruct.com.au>
Subject: Re: [PATCH] usb: gadget: aspeed_udc: validate endpoint index for
 ast udc
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ma Ke <make24@iscas.ac.cn>, neal_liu@aspeedtech.com, 
	gregkh@linuxfoundation.org, joel@jms.id.au
Date: Mon, 24 Jun 2024 10:22:34 +0930
In-Reply-To: <20240622095618.1890093-1-make24@iscas.ac.cn>
References: <20240622095618.1890093-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sat, 2024-06-22 at 17:56 +0800, Ma Ke wrote:
> We should verify the bound of the array to assure that host
> may not manipulate the index to point past endpoint array.
>=20
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>  drivers/usb/gadget/udc/aspeed_udc.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc=
/aspeed_udc.c
> index 3916c8e2ba01..95060592c231 100644
> --- a/drivers/usb/gadget/udc/aspeed_udc.c
> +++ b/drivers/usb/gadget/udc/aspeed_udc.c
> @@ -1009,6 +1009,8 @@ static void ast_udc_getstatus(struct ast_udc_dev *u=
dc)
>  		break;
>  	case USB_RECIP_ENDPOINT:
>  		epnum =3D crq.wIndex & USB_ENDPOINT_NUMBER_MASK;
> +		if (epnum >=3D USB_MAX_ENDPOINTS)

Shouldn't this be `epnum >=3D AST_UDC_NUM_ENDPOINTS`? Further,
USB_MAX_ENDPOINTS doesn't appear to be defined here?

What steps did you take to test this patch?

Andrew
