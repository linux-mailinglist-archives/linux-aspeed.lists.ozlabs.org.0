Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DF5943F8B
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Aug 2024 03:43:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZA0/k13R;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZBZj2ZR8z3cNB
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Aug 2024 11:43:57 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZA0/k13R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZBZc4X1cz30WW
	for <linux-aspeed@lists.ozlabs.org>; Thu,  1 Aug 2024 11:43:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1722476632;
	bh=AS1LCHXQtKq6pUr6NLuE7aPFuKrQxaWhJ6ltUhBJHx4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZA0/k13RoCLi1mQmZBnLLd2hgir5BGyXO7uh1qdFbf+okSL6+0jY1qv9XVKBw4Nb9
	 3NhSvt1DuycKpU5kJQyH+OR8lbx4iHd/kVGpbIZadSETlczSYmKIIPeSHuHTa+JTVw
	 r/76CHEK79y5qMbXr83J9vB/YSowkNsgkvJcWNR5vTY1ihdZPDPONxoWgnmtn4XaiT
	 f1vyjiW+jwzzunPdj6rHFh0deh4A1QdWvm8cakFR3CuS1wO4x/EQQQVAyOKnQo89qL
	 UxCeZbYfd6aj2E20b++q/CpASU11v8C9t5Sc5rrkaN3GG58Ya2dHv36TQ7bVItWOk+
	 Y/Wv2hjFXddQQ==
Received: from [192.168.68.112] (ppp118-210-29-70.adl-adc-lon-bras31.tpg.internode.on.net [118.210.29.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4457164B84;
	Thu,  1 Aug 2024 09:43:51 +0800 (AWST)
Message-ID: <3770677daec27d5cfa9c952ba03a77875bc24b56.camel@codeconstruct.com.au>
Subject: Re: [PATCH] iio: adc: aspeed: Use of_property_present()
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Rob Herring (Arm)" <robh@kernel.org>, Jonathan Cameron
 <jic23@kernel.org>,  Lars-Peter Clausen <lars@metafoo.de>, Joel Stanley
 <joel@jms.id.au>
Date: Thu, 01 Aug 2024 11:13:50 +0930
In-Reply-To: <20240731191312.1710417-5-robh@kernel.org>
References: <20240731191312.1710417-5-robh@kernel.org>
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
Cc: linux-iio@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2024-07-31 at 13:12 -0600, Rob Herring (Arm) wrote:
> Use of_property_present() to test for property presence rather than
> of_find_property(). This is part of a larger effort to remove callers
> of of_find_property() and similar functions. of_find_property() leaks
> the DT struct property and data pointers which is a problem for
> dynamically allocated nodes which may be freed.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au>
