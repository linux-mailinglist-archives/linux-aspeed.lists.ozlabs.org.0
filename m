Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 458F78FDC1C
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Jun 2024 03:23:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=IU0jUGdO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vvmmc56zrz3cVG
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Jun 2024 11:23:12 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=IU0jUGdO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvmmX32zwz3cCb
	for <linux-aspeed@lists.ozlabs.org>; Thu,  6 Jun 2024 11:23:08 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D323820154;
	Thu,  6 Jun 2024 09:23:06 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717636988;
	bh=UjCQkvI4M26je9HMZzMsWZBh+I8xIGggZ70FgnVDcQc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IU0jUGdOLenpD5F3uv+BbB0xNmgwD9pDNkrGQLceE8Ldb66Gq1wG/pbcllTuMpFDt
	 jhHjXkTsVGb8alZKkTLPcTzXLFMoN+y+PI/SUV7t9VwKgD92UjacWT/kH0x/aEJDK3
	 RvJiGbUactTxrRhTLRIdM6jgvKenN2TQf9FzK0GsJoU6XLEtVfzgeZLfzigoc8WZFi
	 abArJYOQMkiknuOGYoj94Wh3t2eZo4b1WGWlC7t5b37zjnP7+K9e8IZEO8MPukbHJr
	 lQLl1pWX6lUxNS5xbF1aNfiJ2E7rHRNTWodaGwDqaxB8b1tv+DpitRWjWuTqDpowKn
	 +X7H1mKKf9smQ==
Message-ID: <4faf9b73f1d896b5c65c1934c6f6b95051b49b31.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] ARM: dts: aspeed: System1: Updates to BMC board
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Eddie James <eajames@linux.ibm.com>, Ninad Palsule
 <ninad@linux.ibm.com>,  robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, joel@jms.id.au
Date: Thu, 06 Jun 2024 10:53:06 +0930
In-Reply-To: <4c0eddbf-5397-490c-8c70-a581c7949b49@linux.ibm.com>
References: <20240605160604.2135840-1-ninad@linux.ibm.com>
	 <4c0eddbf-5397-490c-8c70-a581c7949b49@linux.ibm.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 2024-06-05 at 11:29 -0500, Eddie James wrote:
> On 6/5/24 11:06, Ninad Palsule wrote:
> > - Changed temperature sensor monitor chip from tmp423 to tmp432
>=20
>=20
> Reviewed-by: Eddie James <eajames@linux.ibm.com>

Thanks, I've applied this to a tree for Joel to pick up.

Andrew

