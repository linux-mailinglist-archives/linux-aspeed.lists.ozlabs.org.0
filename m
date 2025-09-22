Return-Path: <linux-aspeed+bounces-2308-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F28B8EDC3
	for <lists+linux-aspeed@lfdr.de>; Mon, 22 Sep 2025 05:31:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVTD32gzvz301K;
	Mon, 22 Sep 2025 13:31:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758511875;
	cv=none; b=BliPksiGlhJ/P9cRucVqgM278wwk5e8bJtSCMHFDfwaYadNh++jYcoqXd6n1fsgMPxPuaPmekWELE2UvFPyg9eaVbKto7uryvXyVAfBECPaPytwn73SUq4a5//yO3eHskYEuVT6cIinyoD+1dDKsZJTAXMAAgzIqThp/TFVryUZ9tkaBb/OMuBO6bLDTpWXuyExhBnBTWb5EuTalBCJKTg1STq1oeQx2rGLUAA2s3b124M3bVKRA8jwWCGdCyBQ5k4wYZ+f3Zhxb9TDJm7nJi1DF9n9CH1BF/G++k3OpUAGYwZFGKEvVX8VqN4Z5Jw8aZsK9ZF9d2ylkgX50EMGQ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758511875; c=relaxed/relaxed;
	bh=QaXrXcglDQfLa77iJyP30LKs4SsMIIVR73AzHuHaM78=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m7nkvR7ZzbCETDqxWa051J8WWZ/3u9b79xM5hZpiHTE4xuOUFWczZ/awLVa+TPj0BlOP8sIIem9JSpy/ysDRf6fh+hZCeF6m4FRGFE0i3z4WAop/R4lJRe+o1fRtQ5fdkHfa4zQhSRBPVFLD5+yxmGgQZhjld+T4P5cQQPFpaQDvMtHL6RqR98BObjvt3YrXEqrACINY9zXb9r1jeiN5OU6vKgDW0jKsyhHH27x+y4Ike86fnDSTkoe0kQ4ASOop3yvdo3byNRdNFIKQxMTy3AH/Bnq5MFYniS/ZLS1yudGo2RfBQGjcQft3IkA19jWSnGTLyIwreHSbxr2rFl6jYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Rusvo56k; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Rusvo56k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cVTD211jZz2xdg
	for <linux-aspeed@lists.ozlabs.org>; Mon, 22 Sep 2025 13:31:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1758511873;
	bh=QaXrXcglDQfLa77iJyP30LKs4SsMIIVR73AzHuHaM78=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Rusvo56ktjDEguZBuTQfb4AjQchdfV9edgcCgAodCW0W37mlsxIXeauzFhBKrrU0C
	 k3gXA+10jTzmnDLpUvyLWAj7MoJG06llM4u9tvjYRoIH12QgE56Iq0IOif2GxuhqYN
	 YuQ3EX0EV18WCOxX9Uwle00U2ufjWyrzFZQ6eFwqEz4wl5PNybQvGwF1HUMKfUowEu
	 arX7eQ7uKFhuXY7FjCeQ9Nf2Fn+2UxrDDzmSQjAxSmSOyL47VpHjcRmQy2OWu44kpL
	 YNpUJEo3U/kxZnBOCRDXDn7wkQ/Wkgafvh2m5x10f1fokQ/2cNH7f02yVCY7K3c/uQ
	 WWpPSzOdaz94g==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E6F7964755;
	Mon, 22 Sep 2025 11:31:12 +0800 (AWST)
Message-ID: <393411916e94245a9f3628c41ebee34c3dd95a98.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 0/4] Revise Meta(Facebook) Harma BMC(AST2600)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Peter Yin <peteryin.openbmc@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, 	linux-kernel@vger.kernel.org
Date: Mon, 22 Sep 2025 13:01:11 +0930
In-Reply-To: <20250917101828.2589069-1-peteryin.openbmc@gmail.com>
References: <20250917101828.2589069-1-peteryin.openbmc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Peter,

On Wed, 2025-09-17 at 18:18 +0800, Peter Yin wrote:
> Summary:
> Revise linux device tree entry related to Meta(Facebook) Harma
> specific devices connected to BMC(AST2600) SoC.
>=20
> follow-up:
> https://lore.kernel.org/all/3a65d568540e9ca43d3bfc24cfe5f72d2bb12b3b.came=
l@codeconstruct.com.au/
>=20
> v1
> =C2=A0 - Patch 0001 - add new line between the child nodes
> =C2=A0 - Patch 0002 - use power-monitor instead of power-sensor
> =C2=A0 - Patch 0003 - dd sq52206 power monitor device
> =C2=A0 - Patch 0004 - dd retimer sgpio
>=20
> Base: tags/v6.17-rc3-39-g07d9df80082b

Can you please rebase this on the aspeed/arm/dt branch of

https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git

Patch 2/4 fails to apply.

Cheers,

Andrew

