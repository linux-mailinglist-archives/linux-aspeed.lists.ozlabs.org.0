Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB4D95C402
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Aug 2024 06:03:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqmdQ5x0wz2ypk
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Aug 2024 14:03:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724385800;
	cv=none; b=mbP/8KHhIRCRpw+quMH/4eVfgYwgUiqsiAtIHL92Vczw/l5zptmLBVWsGgiBDzJVUSaFdNopMXg+3tV3G3DQrRZSQYOn0Ggz43LYmRiJvj7B2De/b4f+bm4fHUFTfZpeBSmK24tMrUED/cLIgE7Y8ulTiIuP8PlfRLvM7pLdVKGrKe/PaxwhNOhLTwNqr/K7lnr1UN9fBJY1+pfV5TP8CsYRnJEAteO4frmKlQ7Pzncfu+Sn8s/4bq7tzQQhm16R09n+qZUrCBxE5ScBzGCsNCC7l1q/8N96zBtPNPfU3nS4fPWnvY7h2GyOYHxYXWRrwgzYJmJUpZevxr8G6FllLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724385800; c=relaxed/relaxed;
	bh=0BGNICJbwFRbFS1gHm/2X9vvhx5Sb5WbrQh56cS3mT4=;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version; b=Wt92vw7DK6VCUFOfdlROU2bjFGzCDRBY6xPdvWM2hixmba3qif44dtgsGSflebYc4916oRotAxHyvA9xjacJ+nUb6KP3PrRnjxdz8KBzFGcNpbW5D0VkeXSsFwUAqbyC6pfVEGALxkS046sX0zLO6lqtSDkoGnJFSBzTKz28U5zMORqgNtfrvpYOGnvQDHvW4WWqWUcfyPBRU3g70nnhzQEzhjDPxhra3+66xssIJz2RYK/J3f0qUrEQcrfGgSeMG9mhUZfM8WDXE6YrMsrTH5cXFtwcnx/mJhSqljy4wMpvRPnHsoQExvM1dgcriUHxzrdYnpV9yVJfQ2GvcRyG1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=EpS4J3qO; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=EpS4J3qO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqmdN0hbQz2yGD
	for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Aug 2024 14:03:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1724385799;
	bh=0BGNICJbwFRbFS1gHm/2X9vvhx5Sb5WbrQh56cS3mT4=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=EpS4J3qOG8AIoVI/yED1bcJKnNprbzYLbrKb73q/lfFL1BUT7S1m2VYmW++cSywrq
	 ZAJXDW76vV7TF0oFromTCUrCFvxCINSMoKSmWBxnlsieUgYNrib3M2mrJrVaSzgCZH
	 v2zYjq0L6G4CKQ5RJms+bvDREGc+HVGewgPcCG9PrKsa2a/HTuE+yrRo1J1H/DCCvR
	 W4glXL5RWHvvYS9AIP8If+vBgnDfeveL44OGYCpW8XAZmgJFXGzwyioEj6184CLkP1
	 eMbnHOxHCcLNSxlpo+xNoHX9LYpDUS923VKVYNinrVfJ02x8n8QRxsawzelMZ6OzK9
	 7gJvWL6EsrteQ==
Received: from [192.168.68.112] (ppp118-210-185-99.adl-adc-lon-bras34.tpg.internode.on.net [118.210.185.99])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1569C64FDE;
	Fri, 23 Aug 2024 12:03:19 +0800 (AWST)
Message-ID: <703d486dc1d268aaad03d916aef12a031473139c.camel@codeconstruct.com.au>
Subject: Re: [PATCH -next 2/8] hwmon: (aspeed-pwm-tacho): Simplify with
 scoped for each OF child loop
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jinjie Ruan <ruanjinjie@huawei.com>, jdelvare@suse.com,
 linux@roeck-us.net,  joel@jms.id.au, linux-hwmon@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Date: Fri, 23 Aug 2024 13:33:18 +0930
In-Reply-To: <20240822062956.3490387-3-ruanjinjie@huawei.com>
References: <20240822062956.3490387-1-ruanjinjie@huawei.com>
	 <20240822062956.3490387-3-ruanjinjie@huawei.com>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 2024-08-22 at 14:29 +0800, Jinjie Ruan wrote:
> Use scoped for_each_child_of_node_scoped() when iterating over device
> nodes to make code a bit simpler.
>=20
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
