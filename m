Return-Path: <linux-aspeed+bounces-3653-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AkeC+jNs2n2awAAu9opvQ
	(envelope-from <linux-aspeed+bounces-3653-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Mar 2026 09:42:16 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA50127FDED
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Mar 2026 09:42:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fXHzR4p0Kz3cJr;
	Fri, 13 Mar 2026 19:42:11 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:edc0:2:b01:1d::104"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773391331;
	cv=none; b=DbTyC53yaUokr+zCd4pO8Z/yPvy2Mp1f8QBAWCI7SOaji1viUKXngspjLuilzKBoHm3dwzo0w62kXR9Kp3TwCe82Aui5M8YJBzRJUWlg4cxeLKP8IZd6uWoysbNwuoZVIvD8nkMZeCBlcmS3cGaQrji4DDbO1yaU07JDRiEb/fGcy+Dvtr7Mu7UOOHSrf1EOchTbttb0ubf1kA6sGJ4VAq8CimsGvv5fNFKmOVj6DcMLpvOZdjZ4kG0miszpviEvkX8VlmfoDmrs+um6PZmD3VhA8O58vemJm9o6ScLmZ6R2RAoDV2BANwlv6mKhpq/1EeG82ctcc3psK3U6xqY3Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773391331; c=relaxed/relaxed;
	bh=R8tCMG/oPkaIeRaLZUuC0PLQ4SE/rg0PgKCK6kflpU8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T6ElpnRQkjzIjrBdzp2oLE5Z+7IY7ZvMqLKN5Tf2xaX1kAyNzaTaGXfOqYjO9sYO7rpyQiB44jOJgz/I66wDo2ZfH0ZJZtYIGRnROae3V+7hSZkq+856x1gIEcqnATH3zowY1Ml/SPgurZjZMEn2vX9DLmv/AxUXRT8Huz5zeMRt7kzKYB9bf/LlziUYo5PY6NTEty5xK95AP1DMA+DRG6Lde3M++QhaxretYjkC0SZE3X8kjXb9LLcw5GFwpfWxPkMsKTnOvATFlAzJUpFdj+4Vjvd0R6d8uXQkpomUfy4ElRbtqdp0cFt6Dn5QvuFdF/Xx9FWng7Zll2QyXKbHNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=pengutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 954 seconds by postgrey-1.37 at boromir; Fri, 13 Mar 2026 19:42:10 AEDT
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fXHzQ5dP4z3cJk
	for <linux-aspeed@lists.ozlabs.org>; Fri, 13 Mar 2026 19:42:10 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w0xq3-0005Ai-PR; Fri, 13 Mar 2026 09:25:43 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w0xq1-00039e-0C;
	Fri, 13 Mar 2026 09:25:41 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w0xq0-000000002ma-45Cc;
	Fri, 13 Mar 2026 09:25:40 +0100
Message-ID: <352a522b5325e9db80c880dd7a3a052516f3b673.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] mmc: sdhci-of-aspeed: Add ast2700 support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Jeffery	
 <andrew@codeconstruct.com.au>, Ulf Hansson <ulf.hansson@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Ryan Chen	
 <ryanchen.aspeed@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Fri, 13 Mar 2026 09:25:40 +0100
In-Reply-To: <20260313-sdhci-v1-2-91cea19c8a67@aspeedtech.com>
References: <20260313-sdhci-v1-0-91cea19c8a67@aspeedtech.com>
	 <20260313-sdhci-v1-2-91cea19c8a67@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-aspeed@lists.ozlabs.org
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-0.01 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	TAGGED_FROM(0.00)[bounces-3653-lists,linux-aspeed=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ryan_chen@aspeedtech.com,m:andrew@codeconstruct.com.au,m:ulf.hansson@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:ryanchen.aspeed@gmail.com,m:adrian.hunter@intel.com,m:andrew@aj.id.au,m:linux-aspeed@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:ryanchenaspeed@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[p.zabel@pengutronix.de,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[aspeedtech.com,codeconstruct.com.au,linaro.org,kernel.org,jms.id.au,gmail.com,intel.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[p.zabel@pengutronix.de,linux-aspeed@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:mid,aspeedtech.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: AA50127FDED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fr, 2026-03-13 at 13:27 +0800, Ryan Chen wrote:
> Add support for the AST2700 SOC in the sd controller driver. AST2700 sd
> controller requires an reset line, so hook up the optional reset control
> and deassert it during probe.
>=20
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  drivers/mmc/host/sdhci-of-aspeed.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-=
of-aspeed.c
> index ca97b01996b1..91c36245e506 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -520,6 +520,7 @@ static int aspeed_sdc_probe(struct platform_device *p=
dev)
> =20
>  {
>  	struct device_node *parent, *child;
> +	struct reset_control *reset;
>  	struct aspeed_sdc *sdc;
>  	int ret;
> =20
> @@ -529,6 +530,15 @@ static int aspeed_sdc_probe(struct platform_device *=
pdev)
> =20
>  	spin_lock_init(&sdc->lock);
> =20
> +	reset =3D reset_control_get_optional_exclusive(&pdev->dev, NULL);

This is missing a reset_control_put() in aspeed_sdc_remove(). Or use
devm_reset_control_get_optional_exclusive().

Is it ok to assert this reset control in _remove()? If so, you could
use devm_reset_control_get_optional_exclusive_deasserted().


regards
Philipp

