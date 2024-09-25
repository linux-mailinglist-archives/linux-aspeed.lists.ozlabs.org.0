Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97885984F99
	for <lists+linux-aspeed@lfdr.de>; Wed, 25 Sep 2024 02:52:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCyqn3gv3z2yYK
	for <lists+linux-aspeed@lfdr.de>; Wed, 25 Sep 2024 10:52:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727225539;
	cv=none; b=SRjy90eD72gWKTbegdLoIc7Msm9y1ztdTZhGQk2zaTzoOv70o/OCx+HN6VmgUg2LPupiQvDFqV3rwAg5MvrzLcpOm2yIKGzpbgbaMXJFA7nPVmbQywHpGFUlSE6q9g4LHS4+YtzDz+w4j2X+vDcr06OoN4OICYqFWXL8dWWcgg35p0ihHYuyu7B84vfz0NN+2dMT54lggeoUWZmOe27aDTt/2j62pvcRegfurHgaTTo34Hn8Biy8mq3Z67jr65qjD8SmW0iTLUpOE4Z8cTm8bl+Dsvf4IpODZPyQNfAShHgz1GaXZlIOV78dbRvXyPJ4O9alCE+toMWeTSkjzrFDFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727225539; c=relaxed/relaxed;
	bh=H41MwTF6Q/0M5m52myZT/avRhCCOCQD58PwjMxG+d2o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VwlLOqdypabQbfJwr2lktZ09irlKq+84bSSPp6gkC4B0WXkZ8mWRvT+WrWCD4IDlGvyU9NfhIdNTVVa7olJLC03rpqsv+nzfFSg2IC1GIjoEw3yM/kb11wTvnDiaNpowJeZqWmJ1/MfKvDnEExwshzMfp5W31te0iwPWME7oCGewnWJtoVsrnDrqLjvwqyWv7YEhsr8y4gVVvRyFqsRFFxvt9sznMPNJw7nc1ne7mxLbvsrQ99pSbWtkfAvGjfV5NrczA+exBeD9dvtZf12DscVRhOI0UsuOmPHK8xFiQl3xWe+Ks8q8qKRMOSSCzspY9WM6OpzEm3N1FbNWbJqZjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ltm86nbS; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ltm86nbS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCyql24T7z2x99
	for <linux-aspeed@lists.ozlabs.org>; Wed, 25 Sep 2024 10:52:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727225538;
	bh=H41MwTF6Q/0M5m52myZT/avRhCCOCQD58PwjMxG+d2o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ltm86nbSNvjkJzSCE4aLPSfMtUPzfUzH7wjwi0PXJLMqYoMSi+3RNOBnO72DHOiYe
	 OBdVdKTVqnloivy0DiMNFPWU96dRqYSw6Ik6I+xFgv3xw/lSN9JzdARQaCIKv3PVky
	 dj+D9h9l9KGn6omJcmCOPvSkBY8Msp7rb6oyDhgAaKGNwe4uqnpSN/9aOeaLURg2VB
	 rrUum7NUjII6IfMyCTyHRBqzhpnanytmkzC5dtEqfW7GV6l5vEHjKb76dZUm1HrTJ/
	 nBsc2zY20njrK71szh16uTY5k9StvzPzWDK0Q89gvKtU5LP/Tku5jGDETqC4vRnVB5
	 wWbgG/38pGbrA==
Received: from [127.0.1.1] (ppp118-210-177-92.adl-adc-lon-bras34.tpg.internode.on.net [118.210.177.92])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0AC7F64C85;
	Wed, 25 Sep 2024 08:52:17 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: patrick@stwcx.xyz, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
In-Reply-To: <20240924094430.272074-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240924094430.272074-1-Delphine_CC_Chiu@wiwynn.com>
Subject: Re: [PATCH v2 0/2] Adjust the setting for SPI flash of yosemite4
Message-Id: <172722553796.384629.2084285836291139720.b4-ty@codeconstruct.com.au>
Date: Wed, 25 Sep 2024 10:22:17 +0930
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 24 Sep 2024 17:44:28 +0800, Delphine CC Chiu wrote:
> - v2
>   - Split the patches for different targets.
> - v1
>   - Revise SPI flash to dual mode.
>   - Revise flash layout to 128MB.
> 
> Ricky CX Wu (2):
>   ARM: dts: aspeed: yosemite4: Revise quad mode to dual mode
>   ARM: dts: aspeed: yosemite4: revise flash layout to 128MB
> 
> [...]

Thanks, I've applied this to be picked up through the BMC tree.

--
Andrew Jeffery <andrew@codeconstruct.com.au>

