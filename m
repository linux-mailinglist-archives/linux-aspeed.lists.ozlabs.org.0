Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A8C84503F
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Feb 2024 05:24:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=fQrSd4qc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQQmH72DKz3cCh
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Feb 2024 15:24:47 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=fQrSd4qc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQQmC3y07z3bl6
	for <linux-aspeed@lists.ozlabs.org>; Thu,  1 Feb 2024 15:24:43 +1100 (AEDT)
Received: from [192.168.68.112] (ppp14-2-76-194.adl-apt-pir-bras31.tpg.internode.on.net [14.2.76.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 196E3200EF;
	Thu,  1 Feb 2024 12:24:42 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1706761482;
	bh=U4sISEKt02jIu1Z70tHRx14a4uWJpHeazAZDZYIWDZ0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fQrSd4qcCD1tjNXsDT3wL5kJC2lI0+MVKcom50SIcV2a+OCf8DeFwYpsOZRquNJ/3
	 85+CmQIuTwm1ep70RYPFxzPSR4QfCCHI7euRbtaooLRBp5txKgr35wVgwf0S5rmY9w
	 vcg9QsRjN5BxpkEmgLAKwOJzCbZIozrtE365pmd9mNMamDfIzWViEF2yA6LDrtHaBp
	 qq7j+kZmzJd+NE11FfMZjTCnWxKs/A3lNobxPbK/iNNCj8LliM/T0klNJKc1bsss4T
	 ajzL4TB26ZCReL3+hAWK3EABkO3h720Yml2WRF8baLsfocOV31xCBPMYblTt9g5CDT
	 CPi0CKrWqGpww==
Message-ID: <b6ebc334da1538034c61bbc1dcef5803ca29ae2e.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 06/21] ARM: dts: aspeed: yosemite4: Revise power
 sensor adm1281 for schematic change
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>
Date: Thu, 01 Feb 2024 14:54:41 +1030
In-Reply-To: <20240131084134.328307-7-Delphine_CC_Chiu@wiwynn.com>
References: <20240131084134.328307-1-Delphine_CC_Chiu@wiwynn.com>
	 <20240131084134.328307-7-Delphine_CC_Chiu@wiwynn.com>
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
> Revise power sensor adm1281 for yosemite4 schematic change
>=20
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>

I'm not enamoured by the lack of a description, but at least the
subject provides the motivation.

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
