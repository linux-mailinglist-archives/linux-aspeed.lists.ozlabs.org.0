Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7D5872C63
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Mar 2024 02:58:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=dE+2u2UA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqFvP0gm5z3vXY
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Mar 2024 12:58:09 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=dE+2u2UA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqFvJ0knMz3bnc
	for <linux-aspeed@lists.ozlabs.org>; Wed,  6 Mar 2024 12:58:02 +1100 (AEDT)
Received: from [192.168.68.112] (unknown [118.211.95.229])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 66CCE2012A;
	Wed,  6 Mar 2024 09:57:56 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1709690279;
	bh=o5h/qQVxLt6NgE3T7v9N6ShWViN6kDVH3QiOpWQqsak=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dE+2u2UAb6a5khpCTeuPk8iEVASrLmENsbUJ9nPTxGSdMXjqCuiR6AUIFBkZTc7sV
	 DH2XLXLm29HYc/0CsrLIQfwKOb7M+/YshyTYCgR8N9UrBbfEMNtcWFRCE4iSgU5Pzg
	 h7XE+Mr7feAuKjR23/sZcYM7E5FHTvVkogt+bt3K/WIzmJUjKlFgrRbFB8qxm/nnI6
	 YKa1ZISZuV7XDdoR9Om7UohrKqBExO61zxuJ5v/CRPGKbJglDCMa6aGdOwuUcpB9tI
	 BjhNOr1f1omSWW8TEEtT0BKusb0ULHwaT+jvh7xBP7zlJ0z7at2Weu5eBUA0bNzcbY
	 wIyS2bpKO3LTg==
Message-ID: <9b390f91102100f1e91098e9d49d6f200aa8a6fd.camel@codeconstruct.com.au>
Subject: Re: [PATCH 5/6] ipmi: kcs_bmc_aspeed: Convert to platform remove
 callback returning void
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, 
	Corey Minyard <minyard@acm.org>, Joel Stanley <joel@jms.id.au>
Date: Wed, 06 Mar 2024 12:27:55 +1030
In-Reply-To: <d125e83788ddc27fc52a3f11b2c329b40cbdd6f9.1709655755.git.u.kleine-koenig@pengutronix.de>
References: <cover.1709655755.git.u.kleine-koenig@pengutronix.de>
	 <d125e83788ddc27fc52a3f11b2c329b40cbdd6f9.1709655755.git.u.kleine-koenig@pengutronix.de>
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
Cc: kernel@pengutronix.de, openipmi-developer@lists.sourceforge.net, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 2024-03-05 at 17:27 +0100, Uwe Kleine-K=C3=B6nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>=20
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Thanks!
