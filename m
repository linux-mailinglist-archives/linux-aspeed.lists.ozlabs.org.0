Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8AF9560B9
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Aug 2024 03:09:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnDyd62N1z2y1j
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Aug 2024 11:09:29 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Q+VWMumz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WnDyb3ftzz2xKL
	for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Aug 2024 11:09:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1724029767;
	bh=yz/+8B9GNOVhFnORnm/MLst64QryVyajcI2MoXzptos=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Q+VWMumzjT3Nzwdjm0TlYIGyknFPM4eKf4kW9trjvLOIvRo895HR48Y7SEpoC85+r
	 pQ4r3ONfEMTNP2at0VN0Wc+KlREvrtGBRSy3NeGG1x/U9rd0kKHsbCOAtLaEIAaU32
	 9afugKe/ihfprMF1yhPS9VwtAIoTeSU7NWhPVD1EUrCGE2zw9HYvQR6o4y90+J8MLZ
	 ph29j2DmIds6O9iA979G18Cg9CpDwtvmLWqCjJ68TtP3HBnio0Xoyv9MRfu2xoct9W
	 7EL4nCseAtKFWqvobUtkqBK4DuSJMfallcvb0Zr8iK1MYnDgZvKtOTtnPDooIMaLSX
	 VoHjW09jzGxfg==
Received: from [192.168.68.112] (ppp118-210-94-119.adl-adc-lon-bras32.tpg.internode.on.net [118.210.94.119])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4837D64BE9;
	Mon, 19 Aug 2024 09:09:26 +0800 (AWST)
Message-ID: <0935f710c5d4e306f616bb2a35bd0d75dd9e84c8.camel@codeconstruct.com.au>
Subject: Re: [PATCH v12 00/28] Add i2c-mux and eeprom devices for Meta
 Yosemite 4
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz
Date: Mon, 19 Aug 2024 10:39:25 +0930
In-Reply-To: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240816092417.3651434-1-Delphine_CC_Chiu@wiwynn.com>
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 2024-08-16 at 17:23 +0800, Delphine CC Chiu wrote:
> Changelog:
>   - v12
>     - Fix GPIO linename typo and add missing GPIO pin initial state.

Please make sure to run `./scripts/checkpatch.pl` and `make dtbs_check`
over each patch in your series before sending it. Also, please respond
to review comments. Either acknowledge them and change your work, or
discuss the problems to get consensus on how the changes should
proceed.

Your patches will not be merged if you don't engage with the feedback
from the people reviewing them.

Finally, as it stands, the additions in the series amount to 75% of the
existing devicetree. I feel like it would be more effective to replace
it in a single patch or rename the existing devicetree out of the way,
and not try to maintain a 28-patch series. I assume all these changes
correspond to an iteration of the hardware design rather than some set
of incremental changes in their own right, in which case a new
devicetree seems appropriate.

Andrew
