Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A546498CAF2
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Oct 2024 03:45:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJHhB3R7tz2yPq
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Oct 2024 11:45:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727833544;
	cv=none; b=oj31bDghfT9ljWAoiYd3Kl0Z8SH3F3QgAw006XK76MSSVa9+XfaDT3GZC8KnfYTClDkBeK3oa3SGAZ53CJeixwkCqtZDwbU+y7cxtHtPruAzi5K0odg33SbOG4VmVbz6ZEDLjRlQ2Y0gcgqfrlMxVC92n768zgwBDb94efAf9ync6QLLmGelOminkoQpmZq9FIy5GIxbS+5bgBUCz/QgSdSXsR26uvhs/Lcxm0telkJjFFzg8Ds9e8xgiNykjy0XGgzMsK2etV/0bHK8xu9CwyFRVDwB6wdjmBa6LaUJLtsappsiY3ORuFheN5367WFNVqS/FK4xal9CyXzVUkLQSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727833544; c=relaxed/relaxed;
	bh=h6hDxQtvLGT++p+WhFFHHCGOItfXEFrbkqWTcpqFG7k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OjsYU0BSD57yS9Y5nNW3r9pZqNAM1hrY+TXvE3kQGGRP2D8lSFL4lCxrWSHt4gw3wrexpikF5aR5BbMKeOaRK9ixmqSyOlm9VdpC9NQRSYC7/BGogGkC5N1ITYGfwylSfulNh7KnOVxcBfRwpSu4LwYg+7VG2IfMOw7okt+MspITUTKtJYNU0Td0Vt0WXRb1WVkbqy/OR70whQkMdbhLvajJ9cbxLGtsop2thX2Jz7dJlW1yJs5nNceWvXoRpG7qrbzYQzoMHulx6f8cn+LiXBG43aSoN+cWRYETT/7lgWAZV5uh7m2/SmcAGi/60FrtP7FCvBje5Px8UpSKJmDBMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=UYtMhb9s; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=UYtMhb9s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJHh83BNqz2xjh
	for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Oct 2024 11:45:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727833543;
	bh=h6hDxQtvLGT++p+WhFFHHCGOItfXEFrbkqWTcpqFG7k=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=UYtMhb9s60nVVl28DuukmvFsrCNEXLegHT2d6PNUQbFSx5CYO947pifBZDDp5BPea
	 fL4tqqYK6LyvMFUB6GdELZ1+rs7b/CDWVeWL1Q0qczxvhRw4ahQOz479AQ4TYY+Cl7
	 1NOC8FwGJ43Sx4ND1kOaSP/fqpVRM1kIdhBpst2NtiYJVh7oAn2JDT2+uOqI17BPTG
	 6lWb+svK2AUq+Ah2R5mzd2oC0z1c4NpdqjhkBhyLnnF/9dDfJ0So5iUAz5L0iphi9W
	 u0/j97+lQ9/2hdtc85KkbNNe+/OUNm4F7KkluDTLo8AyGdCtlly7RNRRBpqsWI7rJt
	 5meLKIX1mDfKw==
Received: from [192.168.68.112] (ppp118-210-73-17.adl-adc-lon-bras32.tpg.internode.on.net [118.210.73.17])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D0DD865013;
	Wed,  2 Oct 2024 09:45:40 +0800 (AWST)
Message-ID: <21415012dec630193b916900f1382d5518d98042.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 07/10] ARM: dts: aspeed: yosemite4: correct the
 compatible string for max31790
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Wed, 02 Oct 2024 11:15:40 +0930
In-Reply-To: <20241001082053.3455836-8-Delphine_CC_Chiu@wiwynn.com>
References: <20241001082053.3455836-1-Delphine_CC_Chiu@wiwynn.com>
	 <20241001082053.3455836-8-Delphine_CC_Chiu@wiwynn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 2024-10-01 at 16:20 +0800, Delphine CC Chiu wrote:
> From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
>=20
> Fix the compatible string for max31790 to match the binding document.
>=20
> Fixes: 2b8d94f4b4a4 ("ARM: dts: aspeed: yosemite4: add Facebook Yosemite =
4 BMC")

Can you please order this change to patch 06/10? That way the fixes tag
is meaningful. Otherwise the fix is disrupted by the code motion in
06/10.

Andrew
