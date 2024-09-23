Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD99497E450
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Sep 2024 02:25:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XBkL93SZkz2yTs
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Sep 2024 10:25:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727051151;
	cv=none; b=IdzoPrynEs6kNAtkDEcP1uGfopOD+KoWG7vemD7v0xYWdB2aArYllYBgEGPCYGpBnOjINa1achjEOoJb/cO0IKNUhAShoLjrDAz167a4Vv03DvkUN5qnVV7ZG54I4heXywTPQ6KXB/8h4VuiKRiyFcNM3psQpnUpk1wSLh0qLxF5c29IORjfERiPSzLWk8mE0/K17o7nGfVFMOLwluFDtCsGAGiaFd6tFhK4w+iaUxGXxjQ4GbBqXQVoOdKeo46he/o2gXFsSoahSQcrE/AmArVfntyU4rCyO7rGJFRREwAvv+9HNfAzWjEnnlYGRo1GerPbPGZ6zgbGw25qfUirmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727051151; c=relaxed/relaxed;
	bh=m2ylV1fvmSR+GVeWeCt0MzBDC2hyi/nxrjXhTegZx/E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jGbR79kgYYp+/NVSnSTWel/TpA+YykFI+NhgpMwFWUHGTnhSO7h7mGhN5GcslIu0D6ppTq659cZDtQLcwvcojBdtkYpiXz0NSlr1VoR52QV4aHVRhD0Wsu2h7oxem6CSht45/NOMpPey+b4uoJpD55ANc+rDGcCNvjXIsVI4ZYe9tww5vcjKq5JlYaioqAulSeSDLPZAFhgUXa3FVDE039jaRVbTYkNNo7js3mCp3oBiqNGlmaw5GxGnIdAiI1Z3CTXvy7lBYUX/+A+3sRMroplQd1uX+TO+2gvaS21FxL9qzBRBFZH/VBLkytyPm0jFLhNfFRH1Kzcq5JFsLwzI7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=PwssHF88; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=PwssHF88;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XBkL670ddz2xgv
	for <linux-aspeed@lists.ozlabs.org>; Mon, 23 Sep 2024 10:25:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727051148;
	bh=m2ylV1fvmSR+GVeWeCt0MzBDC2hyi/nxrjXhTegZx/E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PwssHF88v24UVY7WeXED4544VQEhvdPzUtxoEPeYJFX0W7RLUsFiup1FXtDCo7cYk
	 IzyUW03mwQhYOjk4Zsl85wL+Wx6uiCp4H+yMmcmnXFgITHwh1sweJpLI1BK53SeHS9
	 Eu060sHr6HGLu1EtgIBFZjnrbjOw6X3Jb8xmCVYMydYkFrQCyLlgyOzE52o1eLSET/
	 l3ZReIG5gxsgicY/BDIn9YFr6fhKpUBjlACHBZ8xUqsDVdC6LzWflxI7f6x7+jvKxq
	 +U9FulKP1t10G0ifPtjTMTM6bEoMVHX8N4t4bdl0yTzB3ZNRjfcRRjzF7ct3nYVhvy
	 cyKFYdssQI2Aw==
Received: from [127.0.1.1] (ppp118-210-177-92.adl-adc-lon-bras34.tpg.internode.on.net [118.210.177.92])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id ECF8B640E8;
	Mon, 23 Sep 2024 08:25:45 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Patrick Williams <patrick@stwcx.xyz>, Potin Lai <potin.lai.pt@gmail.com>
In-Reply-To: <20240920-catalina-i2c-mux-fix-2-v1-1-66cce7c54188@gmail.com>
References: <20240920-catalina-i2c-mux-fix-2-v1-1-66cce7c54188@gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: catalina: add
 i2c-mux-idle-disconnect to all mux
Message-Id: <172705114554.52616.12455513368806035629.b4-ty@codeconstruct.com.au>
Date: Mon, 23 Sep 2024 09:55:45 +0930
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
Cc: devicetree@vger.kernel.org, Potin Lai <potin.lai@quantatw.com>, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 20 Sep 2024 17:55:52 +0800, Potin Lai wrote:
> Add the `i2c-mux-idle-disconnect` property to all i2c-mux nodes to
> ensure proper behavior when switching between multiple I2C buses.
> This avoids potential confusion caused by device addresses appearing on
> multiple buses when they are not actively selected.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

--
Andrew Jeffery <andrew@codeconstruct.com.au>

