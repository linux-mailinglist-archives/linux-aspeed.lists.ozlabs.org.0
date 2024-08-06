Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEEA9487C8
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Aug 2024 05:02:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=lwwbfBXE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WdJ4M62sLz3cfg
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Aug 2024 13:01:55 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=lwwbfBXE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WdJ4C0Qq7z3bc2
	for <linux-aspeed@lists.ozlabs.org>; Tue,  6 Aug 2024 13:01:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1722913304;
	bh=M0QMkszaeDL5hyqoTYcPs5FeLwOUmRv15dxB29QafcM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lwwbfBXEB+9gtWp4Vrsom2CubA2Ms/9yLCYJsguZQtolPrzRs+iaWRDEUiQ3QjMj3
	 al2CEWdFSbODMUkQVljr3RI3xFmLMznSLAV39OFkJlOv2wwMWGaIkF3+DN5OhT58cq
	 VHkZe+JFzSzZMFinKA3+jUOLYeXw87fqjfmiY1snL408dMhOTMXr/ev9YgvVcs+nUl
	 6LL8ZXzKoY1qndZvesEoXtUXgJ2hCfRasxK3lTeUaur/Siog5xccUbd9cFvE9EfCwP
	 a7Zpjej9T/BuyrnNYLOVKQbwUQEhr5Z710URDrXnyL0eWj+TbdSl9PVVcve9XaXX9Z
	 z5YRtASfCrGIA==
Received: from [192.168.68.112] (ppp14-2-105-65.adl-apt-pir-bras32.tpg.internode.on.net [14.2.105.65])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4771865669;
	Tue,  6 Aug 2024 11:01:41 +0800 (AWST)
Message-ID: <1c6598d080d488005b14e127396dd7db72bc4ca4.camel@codeconstruct.com.au>
Subject: Re: [PATCH v7 0/2] Add Meta(Facebook) Catalina BMC(AST2600)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, Patrick Williams <patrick@stwcx.xyz>
Date: Tue, 06 Aug 2024 12:31:38 +0930
In-Reply-To: <20240805-potin-catalina-dts-v7-0-286bfd2ab93b@gmail.com>
References: <20240805-potin-catalina-dts-v7-0-286bfd2ab93b@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Conor Dooley <conor.dooley@microchip.com>, Cosmo Chou <cosmo.chou@quantatw.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 2024-08-05 at 23:46 +0800, Potin Lai wrote:
> Add Linux device tree entry related to Meta(Facebook) Catalina specific
> devices connected to BMC(AST2600) SoC.
>=20
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
> Changes in v7:
> - drop 'pinctrl-names' in gpio0 node
> - change 'vref' to 'vref-supply' in adc0 & adc1 nodes
> - add p1v8_bmc_aux & p2v5_bmc_aux nodes
> - change Signed-off tag email as same as sender.
> - Link to v6: https://lore.kernel.org/r/20240802-potin-catalina-dts-v6-0-=
0b8f61b80688@gmail.com

Thanks, I've applied these to be picked up via the BMC tree.

Andrew
