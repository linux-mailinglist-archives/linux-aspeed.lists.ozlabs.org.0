Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 738837BEF09
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Oct 2023 01:21:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=MDVFhqOU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4FQS0JH3z3cNk
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Oct 2023 10:21:04 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=MDVFhqOU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4FQG184jz3cTc
	for <linux-aspeed@lists.ozlabs.org>; Tue, 10 Oct 2023 10:20:53 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-84-62.adl-adc-lon-bras32.tpg.internode.on.net [118.210.84.62])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 829A220172;
	Tue, 10 Oct 2023 07:20:45 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1696893649;
	bh=JTRSLBNiIkCIhjXig6lczJ6V8eRPuYQWUv51vi2IL1I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MDVFhqOUc3knrJ+wCEcPV1zgCQWdqYPDsn0RyZ2HUGmkB+QKsr3n4wDaXO6aefpog
	 D0GqC5qQqgaB0MOb4DBlXebh4rVmrTrGDOcOY/m8YcTpG8GACYECyqvqU45NrhRJmJ
	 7yUIBIK6lJR3HljSrGWYe6NfnE5kYLv3fxEWdkGl2xqrR4KC3g/hnj88hZqsRtwfws
	 oMdhcbHiATD0rT9kI6t7FgyDZhJDoLBovkRf0LH8o0BIQaRzxYZI48hdUXU6wpzv2u
	 FnOyg44+Aw/GTbRaczc3FlDSut7uxTqIusCwwQy73k0TZ2Kmk0pKsBgRcQBzghR3IV
	 lGErUHnepoE9w==
Message-ID: <e303d57d5bac0bb8227e09ef6eea5867cf7866d9.camel@codeconstruct.com.au>
Subject: Re: [PATCH] crypto: aspeed-hace: Use device_get_match_data()
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Neal Liu <neal_liu@aspeedtech.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller"
 <davem@davemloft.net>, Joel Stanley <joel@jms.id.au>
Date: Tue, 10 Oct 2023 09:50:42 +1030
In-Reply-To: <20231006213917.333702-1-robh@kernel.org>
References: <20231006213917.333702-1-robh@kernel.org>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 2023-10-06 at 16:39 -0500, Rob Herring wrote:
> Use preferred device_get_match_data() instead of of_match_device() to
> get the driver match data. With this, adjust the includes to explicitly
> include the correct headers.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
