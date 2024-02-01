Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A1C8450D1
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Feb 2024 06:38:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=PP/af9l9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQSPW4jMPz3cSd
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Feb 2024 16:38:39 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=PP/af9l9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQSPQ6Ps4z2ygY
	for <linux-aspeed@lists.ozlabs.org>; Thu,  1 Feb 2024 16:38:34 +1100 (AEDT)
Received: from [192.168.68.112] (ppp14-2-76-194.adl-apt-pir-bras31.tpg.internode.on.net [14.2.76.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 576212017A;
	Thu,  1 Feb 2024 13:38:33 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1706765914;
	bh=Djpg8Xnc1IJVcbJPW8SjjmQo0regqTyJKFMwqv4OXbw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PP/af9l9bFr2QNXvgnCn2BcsvEpY2qXdt6Np6mKIWRpCPFfZSJVb1ZKSg3nPurIKm
	 /850HSmfwdSAs4W1QpZF/IP+MGpXovTn02HVcofBCSfrDQOipiAC/7Ms58wuK+yep2
	 CF7C+pho5eRiVtFBM4kus9xaCLUgkYdlqXZab326U2Ygi5yampCxnC5awK6f5TbT2D
	 D2wJeyB9xpEZOAtvBdDt5xabe3+/N7thwwzU2cTtD6HthBpipa6Y22Fa1EqEHfpFwH
	 cbMwKVONimkQqh8qmPV87tMuAoOOatQfuLyDrcI2k3tj246AESQtrA/sJ4rWmrpjH8
	 PIYWeHmqG7A/A==
Message-ID: <614175735b8dc7e9426065fc433fb8e805a84734.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 12/21] ARM: dts: aspeed: yosemite4: Remove
 temperature sensor for yosemite4 schematic change
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>
Date: Thu, 01 Feb 2024 16:08:32 +1030
In-Reply-To: <20240131084134.328307-13-Delphine_CC_Chiu@wiwynn.com>
References: <20240131084134.328307-1-Delphine_CC_Chiu@wiwynn.com>
	 <20240131084134.328307-13-Delphine_CC_Chiu@wiwynn.com>
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

On Wed, 2024-01-31 at 16:41 +0800, Delphine CC Chiu wrote:
> Remove temperature sensor for yosemite4 schematic change

Presumably the schematics are versioned. Which version is the patch
moving the DTS from, and which is it moving the DTS to?

Andrew

