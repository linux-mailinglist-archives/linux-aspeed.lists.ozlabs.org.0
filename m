Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A89618B2DD3
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Apr 2024 02:06:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=VkPDaFId;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQY0N0VCLz3dWv
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Apr 2024 10:05:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=VkPDaFId;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQY0H0PMQz3cQL;
	Fri, 26 Apr 2024 10:05:51 +1000 (AEST)
Received: from [192.168.68.112] (ppp14-2-127-66.adl-apt-pir-bras32.tpg.internode.on.net [14.2.127.66])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0606020075;
	Fri, 26 Apr 2024 08:05:48 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1714089950;
	bh=CjwNDKjXhsM6QaPQ9xqvcH9roA584MXAnlsd9Qa9tkI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VkPDaFIdUhDZiv4DhmhOLwITpeAhF01fy4hpFZeJTvUQh8Mss0bibnz8qCqGo2iCl
	 DVUmUB6jdkMbCgUwdbtq/iAXAX1Wyfl67E8jmUilcsUhWjYt6mgh+io8dmjKCYSNKf
	 AroHYzCWpAy2dw6AEkEnD6FMtkQbYQ2OVfgfvP/mcqSxSfbjllvcGjNDORRwSG0Eg3
	 uF5aG5Lcdd+hTiXNYDRVgoIJxsl5wpTmqkjbscut7N3fivZeA2UfpIr0LYKUwIgUH1
	 JE9zKVm8Bjo/F4pKSYSIOHXofzjqRQHTSky/XvePG4a5XMeTuopC+rrqnp4MORBS5o
	 guX5wmR1UbomA==
Message-ID: <39d0be3341ac886cbe0c201a296e3a899e4eb7b5.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 1/3] dt-bindings: fsi: Document the IBM SBEFIFO engine
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Eddie James <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Date: Fri, 26 Apr 2024 09:35:48 +0930
In-Reply-To: <6c2f8ee1-ec59-4ec4-8d0c-507d98225dd6@linux.ibm.com>
References: <20240419211143.1039868-1-eajames@linux.ibm.com>
	 <20240419211143.1039868-2-eajames@linux.ibm.com>
	 <0aec6a507b9288cdc0f890164951c730f6f430d1.camel@codeconstruct.com.au>
	 <6c2f8ee1-ec59-4ec4-8d0c-507d98225dd6@linux.ibm.com>
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
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, alistair@popple.id.au, jk@ozlabs.org, lakshmiy@us.ibm.com, krzk+dt@kernel.org, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 2024-04-25 at 16:38 -0500, Eddie James wrote:
> On 4/21/24 18:02, Andrew Jeffery wrote:
> > On Fri, 2024-04-19 at 16:11 -0500, Eddie James wrote:
> > > The SBEFIFO engine provides an interface to the POWER processor
> > > Self Boot Engine (SBE).
> > >=20
> > > Signed-off-by: Eddie James <eajames@linux.ibm.com>
> > Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
>=20
>=20
> I'm sending this patch in my new series for P11 BMC systems, with an=20
> additional change for the OCC child nodes. Hopefully that's OK, I kept=
=20
> the tags.

From a quick look I think that's fine.

Thanks,

Andrew
