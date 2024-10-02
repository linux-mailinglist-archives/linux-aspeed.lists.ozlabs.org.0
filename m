Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F6A98CA04
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Oct 2024 02:26:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJFxB5ZR6z2yPM
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Oct 2024 10:26:54 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727828812;
	cv=none; b=cfKJWFqJWVSa96tsRpAHjbu9vrjMQ4SMAgJWBOJstxej6oVXMZ6d73i+J0Mv+Nbr40KPdKgHY/XE6InUe4mDMWXYQH9pfNMA5M4+Cfzn+0+Vfb42W4OlTn2YrIEwzK9y0PwwHw3ot5Q9dCbAm1VqduULticIx2e5T301Grcrn+SNJ1PDSuN4QogyEjOiVm0LHiyS37bZ+o7Vdp89pUFtBTnCH0V2hdO2FOCI6IEu6/RQdQfrbrzSfAICz4I0uTxCYAWDrCZDqRZwwQ2lzaTE1924N91ZODfqe7UfnCcet4iW5kJZm9HonQ/VfnBe0UwGtoL3HShGLcYFw4S4tRzZUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727828812; c=relaxed/relaxed;
	bh=KjLbqCF2jq6cvivJ349ACXivUXPIkq508H08HywwaHQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=li7GfOgtfGjK5T1jQywS6ps5uo1suqxJKVEcCV9X1gSqwLA8YQvmd6fVmxssuUrDnESH3N1fN3tvvt2CP5SigZkwMQBeT/aTxUlH65kYDLNTXCraC/0gvn8XCNZG6yO/vuvufcFcbdZCriuo0rgHIRqZdR2P1KY7/eKaERzYeRdkOCtrDy9y4C9ImM1yqV20lFXIXe7OKiFVs5MBW9VW717WVMt4HgMeb5W11nK1wK1ADwyOQLAi1AZ3tgZLWGGhAdvxdNTL0KYeo30MqcPcM0vmWjbJYviNdwJPAtNnGk6XMsgBzVs1wn5n+Yeu3/dJ1yP/DFJBvm5HI4Nit9d5pw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=FlwVgpGC; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=FlwVgpGC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJFx66zGVz2xjN
	for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Oct 2024 10:26:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727828808;
	bh=KjLbqCF2jq6cvivJ349ACXivUXPIkq508H08HywwaHQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FlwVgpGCaV+Num08HCUA4wxbUH/Hk34Nc+nF5LRT0Xb2fDt3fzkSnSx/cyr01uRPO
	 H7lqvI1jFZKGDFOROblf7oHOLTJSJLTKg4wA6y+0nIDaq3gC66oaNyD/hhbnUTGRyA
	 oOnQrC5KKuBJE+iWiaYaM1Gyb8DFEMelup1Rv8iOBylKFT6m1qwAOsiockswszbgaS
	 YsSMmOyS8ABUHz4ohf9n4UqZx3HUzz5TmSFq17DIQ5SXY0RyZICrNTuJz5rcDQmEHc
	 DOSVywg3+Fmxjaq3ByVTwkRP5BKi22Funetag2q5KLEaCrddkA9e7TiRiAzYtj9Abe
	 Vb7/DguZly2Bw==
Received: from [127.0.1.1] (ppp118-210-73-17.adl-adc-lon-bras32.tpg.internode.on.net [118.210.73.17])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E3BA465013;
	Wed,  2 Oct 2024 08:26:46 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, eajames@linux.ibm.com, Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <20241001191756.234096-1-ninad@linux.ibm.com>
References: <20241001191756.234096-1-ninad@linux.ibm.com>
Subject: Re: [PATCH v1 0/3] Device tree changes for system1 BMC
Message-Id: <172782880678.751051.14871757116202304815.b4-ty@codeconstruct.com.au>
Date: Wed, 02 Oct 2024 09:56:46 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 01 Oct 2024 14:17:47 -0500, Ninad Palsule wrote:
> Please review the device tree changes for BMC for system1 machine.
> 
> Ninad Palsule (3):
>   ARM: dts: aspeed: system1: Bump up i2c busses freq
>   ARM: dts: aspeed: system1: Enable serial gpio0
>   ARM: dts: aspeed: system1: Add GPIO line names
> 
> [...]

Thanks, I've applied this to be picked up through the BMC tree.

--
Andrew Jeffery <andrew@codeconstruct.com.au>

