Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BF5975E16
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Sep 2024 02:46:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3zK72Gljz2yR9
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Sep 2024 10:46:35 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726101989;
	cv=none; b=BjkHvipJXmYLkHzWxxufdfvhbBWRlQz/eqnU5K73O/tamcQ07tAszrTuBnQ3wN3JNd6ED+TJZF0UMwKd3d64cHniUDKopfo6m2me94/Emx1jVyMngiIqeZOHmozfPDHDw0m+TZRcCRlIslgqvdFdJnsICsnT/DKdFN/WPFNwzIgcF+RS5mrm8jgO85hVlKwE2jKK4+S7ycjNQefWiO3XBnXjzJxDNeSWKtjVbPlgxSM/wju1BXWDyyPFQY8ZY18Ppo9wG5owQRntLvKOG3sI3oTnLUkKfGBR7YEBfC3uwR6JXLwcwJ1IouHn23zp1HxNzkturxQH2m/6jwOCkEQyfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726101989; c=relaxed/relaxed;
	bh=2VQngztHRnEp+3r2CybqohuxIQlCmejfmOOnUHXAJkE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FCq9tZiF8+mM+nM6hpZmqDCI6RpPmJeYLAyD9H4JItN3ewJ6XtD9Sm2aIyXH2yBjTlvTYYJGIhIZDBcOSVtf/IkBldlECmByjXLAXFGCWqJNC5ne741RhnEgS0O5WDy2T4c2sUnPGsuKLEq7xCON0DxP++kdMHupsgRpZnyHbTx0i/ag/T8uLaRbr+KaMu982k6dPAKtMUiPWn235/O034inX9Z3F2vS5YVYlAois7lY9Lfv41E7RuA2fvTbtfE2QAP9ik+uvQ0c1IfgNBo4mM1UDUz8ZRmoiGV6gF3/z5AwY1iZym/4MRRp2Tys5XT1yDmai+bpuRtilSjYaXp60w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=PW33KAQW; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=PW33KAQW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3zK11nddz2xJV
	for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Sep 2024 10:46:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726101986;
	bh=2VQngztHRnEp+3r2CybqohuxIQlCmejfmOOnUHXAJkE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PW33KAQW7ezqXTkUJELheZI99O6C5LbwAW3+2CvLfMDQM7kuDWNsuBK42JvjEo0At
	 AMFs2orEnMf58pl3Z2S8BeQh5Svk7zvXHCpjMUKN+rZ6LA+XWXiBorbe17BwMtLDxl
	 IS4SEwVwmIb65LmAkM/ZySu1BPmlAEQAUv3dU1x2oDYxNPRjb69a19XjIsV07AE8I6
	 leKBCjVdj7zl9qDGbTwmJidNNE2eewIFZvUCBZvPrG+LevXoVRQx2qamgltpbXIVEA
	 IkV8kU4LIaGELgylbCN2ygVXvb+Q39816H7O47OwKatGxkxF0O8780GsDlpLvJwTu4
	 GHI3Mv2tU90OQ==
Received: from [192.168.68.112] (ppp118-210-89-8.adl-adc-lon-bras32.tpg.internode.on.net [118.210.89.8])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1EC5D650AD;
	Thu, 12 Sep 2024 08:46:23 +0800 (AWST)
Message-ID: <082cea8c7ca1aa15001b7c48b1c3ef1f209cc40a.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: Fix at24 EEPROM node names
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Rob Herring (Arm)" <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Date: Thu, 12 Sep 2024 10:16:23 +0930
In-Reply-To: <20240910215929.823913-1-robh@kernel.org>
References: <20240910215929.823913-1-robh@kernel.org>
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

On Tue, 2024-09-10 at 16:59 -0500, Rob Herring (Arm) wrote:
> at24.yaml defines the node name for at24 EEPROMs as 'eeprom'.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Thanks, I've applied this to be picked up through the BMC tree.

Andrew
