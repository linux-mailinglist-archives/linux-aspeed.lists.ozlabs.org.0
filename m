Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3295F8450FE
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Feb 2024 06:49:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Tkjh9udp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQSfR0lxZz3bqQ
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Feb 2024 16:49:51 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Tkjh9udp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQSfL5VSbz2ytp
	for <linux-aspeed@lists.ozlabs.org>; Thu,  1 Feb 2024 16:49:46 +1100 (AEDT)
Received: from [192.168.68.112] (ppp14-2-76-194.adl-apt-pir-bras31.tpg.internode.on.net [14.2.76.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 74CDE2017A;
	Thu,  1 Feb 2024 13:49:45 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1706766586;
	bh=fhdSlQmPjsoJq5ND6PaKO/AKnlEbNn+p1RX7PH3gnk8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Tkjh9udpXYVin4F6L1ot8Jzzzjq8u5kBY4SFX6xDc//wDW10NwBjBs2B1yIasWTkj
	 dEHtmn9YSt4L7lV5SNBZE79QRmOWAhephWBsJlE48j7IDt8KaapqoZodJI6QTPYbh0
	 0r1VhqD2xagfFzWkZl31YuqAnduTNkukPJQIyRn0pHxal2fL2dZIzENXg481LLnx6h
	 b+yd8y+qKkpbYm6GPY0VxOAbMw+akg6YxQ7wjf02scK2H3Y+GHrp3c3x5IPUZ9NhZz
	 aN6wY5U/1yVFoFKvc53uzsYYffgWWIaY4o7+tsZzbD9Vr0U810R88Nif9JV7if7v83
	 0ipsspOETkscg==
Message-ID: <345345fd4475d24a015a37881eda0a4b90892179.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 16/21] ARM: dts: aspeed: yosemite4: Initialize bmc
 gpio state
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>
Date: Thu, 01 Feb 2024 16:19:44 +1030
In-Reply-To: <20240131084134.328307-17-Delphine_CC_Chiu@wiwynn.com>
References: <20240131084134.328307-1-Delphine_CC_Chiu@wiwynn.com>
	 <20240131084134.328307-17-Delphine_CC_Chiu@wiwynn.com>
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
> Initialize bmc gpio state

Why is it important to specify this in the devicetree? What's the
motivation?

Andrew

