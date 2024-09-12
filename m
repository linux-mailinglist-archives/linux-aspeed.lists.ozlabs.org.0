Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B85D975EAA
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Sep 2024 03:52:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X40nC02Cmz2yV8
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Sep 2024 11:52:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726105946;
	cv=none; b=mg184WtjCusFDJevEpgBulhi5WmoqdjpjHQUUi9Dl7npZSCMNeSRMEsqB0+diTKPDugSSxipFncpuuZnc7JqBsusY18GGt4AsQpfUacF0It1XbdGluVaq53IUDXCcREvxewK+cqolPwd4uJdjumbFvKX3MN5biUCpVVI24/pHzGNQpKehtopaOC3WAm113fxKh/opxu0EjwnGPzPi4tsw/MjZkYqSas/k/3tMA5ulfrwUGhXLubBafkNaXoCriIshQUL73dRIESSmEvvlO7n3NHmrx0HoGEGU6TF62ELrIOUZTBSRi9pRIjdobY0W7k6YApvYeaWHucVsS3QMJ25Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726105946; c=relaxed/relaxed;
	bh=1GeFB29HWhumDKOdV+Pt4PnPumW3p49ZFqKR/fUZIws=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=G+rJT4c9lByLoEH2etmcfvczG30HBZD4YDJVd4VG9Ekh6TINhPgnWvCTlvmz5HpLE0D/cPZoS3jLS1OCk1l3DCfoK60f5eAq/lhon+By5yS14hv7U0wNwmaLJkWRvUDcbYoaFDnh2Gjfyh6ich2gaKgx1TpWVaHw5WgezulCmMWEjpfxa4Q+yWTJKpdkVumQs0qy+QEjJgwQfDSKsoIzVZZeBkMtw3pJqPtLEp34O9fg7YXFZwPTSHcoO5rd2wfI9+6IqRh/vkjhe1nUCkg40XQUJUj8mQEyDZXlpaJ0R3j6Lmee9ckehd95AfTY+ZPeJx0outDrRpTZxhoBPx/eyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Q5A+Vg9x; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Q5A+Vg9x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X40n56zwZz2xwc
	for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Sep 2024 11:52:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726105943;
	bh=1GeFB29HWhumDKOdV+Pt4PnPumW3p49ZFqKR/fUZIws=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Q5A+Vg9xklu9nGYZwwkrRoivoF07C5SpEOD7nQh1keYfvyWHQAMfi+ne5k7vYwaw0
	 w8SWXZa5JQr+BbbPvwM3zVXLVdUxQhgAhA8l+g39H5QO2gAyDU8C7IgBkKDo1nkm3E
	 OfWIhzwEN+LY70Pjo0xQuT1KS2ddh5R1kLB/OyRghSC5+4/Vs0x4bDcNFYnfBzFcxz
	 GUvLGSfn1MF3+3TV4Xq58EsKFKm+kLsMIou9PpooLmLyixdI92llR8wLhNJznKAfWb
	 nNbAeJ2NxBFwCpbf13S93dID4Dl2A3ml0G6ELXruHz7EWRf6bpZEOMH6F5HgjwTypU
	 VEJMJkvGmUSfQ==
Received: from [127.0.1.1] (ppp118-210-89-8.adl-adc-lon-bras32.tpg.internode.on.net [118.210.89.8])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E1FD3650D6;
	Thu, 12 Sep 2024 09:52:21 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: patrick@stwcx.xyz, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
In-Reply-To: <20240910080951.3568594-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240910080951.3568594-1-Delphine_CC_Chiu@wiwynn.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: yosemite4: Enable watchdog2
Message-Id: <172610594183.699144.11293347477612952253.b4-ty@codeconstruct.com.au>
Date: Thu, 12 Sep 2024 11:22:21 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
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

On Tue, 10 Sep 2024 16:09:50 +0800, Delphine CC Chiu wrote:
> Enable watchdog2 setting for yosemite4 system.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

[1/1] ARM: dts: aspeed: yosemite4: Enable watchdog2
      commit: 38534704e809d3f253ba131ae1ee8dfb79969166

--
Andrew Jeffery <andrew@codeconstruct.com.au>

