Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF45D8FA7C3
	for <lists+linux-aspeed@lfdr.de>; Tue,  4 Jun 2024 03:54:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=N+2j7c4p;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtYY83VNrz3dLh
	for <lists+linux-aspeed@lfdr.de>; Tue,  4 Jun 2024 11:54:04 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=N+2j7c4p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtYY01f0gz3d95
	for <linux-aspeed@lists.ozlabs.org>; Tue,  4 Jun 2024 11:53:55 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 56C412013B;
	Tue,  4 Jun 2024 09:53:51 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717466033;
	bh=8Myg52lLWrLZOLkXAsnAEtMJuwErLEP/S/CM0D8BeoI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=N+2j7c4pxg+RU3Ui5pOQmzKgoMYWUFKHKG3B7qXpkU9UWks8sRBiil4hs5fn0W+4f
	 sBVA5EixdQawh0U4DWtncxYLquPSpBT4a12DwB0w5vgFeiidPfcJD6jdTwvVs/hQ0Q
	 K3bu0pvugMEJoUdc3dmieC/uRvvWanFdFd7DkbHT+JT4pYx2+Bt3rVK1aoJHZAWSax
	 2ZLzkCYRMNxzCZxq/LkuZr8Ta2gdHfN707jRuIfVnuj7v044T9SVnaRnyyhA11+bOz
	 9LjNi54m5R2rVeebzxiH92jeTXqH3/92lZ/SOocCc6uFoOSoMOnjangCmJZ1WnzZfu
	 DSjkFIgGgefWg==
Message-ID: <9375ace675ef1a6bfb00c916c940fb839ed10289.camel@codeconstruct.com.au>
Subject: Re: [PATCH] arm: dts: aspeed: Use standard 'i2c' bus node name
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Rob Herring (Arm)" <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Date: Tue, 04 Jun 2024 11:23:48 +0930
In-Reply-To: <20240531193115.3814887-1-robh@kernel.org>
References: <20240531193115.3814887-1-robh@kernel.org>
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

On Fri, 2024-05-31 at 14:31 -0500, Rob Herring (Arm) wrote:
> The standard node name for I2C buses is 'i2c'.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Thanks, I've applied this a tree for Joel to pick up.

Andrew
