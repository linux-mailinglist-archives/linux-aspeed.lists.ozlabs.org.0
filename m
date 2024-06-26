Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18989917524
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 02:07:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=LXaNHlwS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W828S546Lz3cYb
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 10:07:52 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=LXaNHlwS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W828L6R3hz3cX7
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 10:07:46 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-79-194.adl-adc-lon-bras32.tpg.internode.on.net [118.210.79.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D6BF720009;
	Wed, 26 Jun 2024 08:07:42 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1719360464;
	bh=WaXeH1CwJQh0yqRTigKsUBZq3GcS2PuMgp0DaeGAN7I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LXaNHlwS+HZ5y2X2J/vB6bvpJbPMhWs9XqiSuo8zdiQcw2raaGO03puFpw5lRBEtO
	 bECin2der35xrQLabJJsrlfScb1SRNwF6zTeR3GIEeDx50WKbzH93ZOnD8r0D/Dl52
	 Rl8dViWrBYIPVxPO6tczVXQbUgQDmED/r5iROkwuzi2w9619e2XfJVOEBahCOYaDoQ
	 OtY2YRBQFjH9CyPR9kRBX22Iw4vujT9haO15cpdPzh+/Hg/f5sGYahxqBp5ofhGEcd
	 jJ1cRYjvzibC7IqCJY00rIjJuwA79MHF+e1i7AZwXgXtSdKhi8Hz9n8TYUzVeNvdaa
	 Saozc3s/dVy6A==
Message-ID: <c025e0db6455e3d79fbaf1ff38d72c9f8db7018d.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4] usb: gadget: aspeed_udc: validate endpoint index for
 ast udc
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ma Ke <make24@iscas.ac.cn>, neal_liu@aspeedtech.com, 
	gregkh@linuxfoundation.org, joel@jms.id.au
Date: Wed, 26 Jun 2024 09:37:37 +0930
In-Reply-To: <20240625022306.2568122-1-make24@iscas.ac.cn>
References: <20240625022306.2568122-1-make24@iscas.ac.cn>
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

On Tue, 2024-06-25 at 10:23 +0800, Ma Ke wrote:
> We should verify the bound of the array to assure that host
> may not manipulate the index to point past endpoint array.
>=20
> Found by static analysis.
>=20
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
