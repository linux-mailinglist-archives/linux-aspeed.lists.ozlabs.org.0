Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 209E18962F9
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Apr 2024 05:30:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=bUtKMepZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8Vd76YBwz3d24
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Apr 2024 14:30:35 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=bUtKMepZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8Vd24BrJz30N8
	for <linux-aspeed@lists.ozlabs.org>; Wed,  3 Apr 2024 14:30:30 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-182-70.adl-adc-lon-bras34.tpg.internode.on.net [118.210.182.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 270AD20075;
	Wed,  3 Apr 2024 11:30:21 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1712115030;
	bh=XF2D2sPHroXYyefKd2obQ6jfostNnDcPvmsVRN+demg=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=bUtKMepZv0QM4/yWwRsJfffJODorh+VnQ7PWH5h4y7I8LiyqOPHErNZc8RoCdrYNV
	 m3w3BPIdVJeB8st3TTGIi14C0r+Vy8hM1A48aGJvquQazkqJZJNvoqF9JySyY1YDjx
	 gNBWjuR5fJyJjcm6AK43GRlHcAM5Te5GREv4X2NPL546io6ZjatZgov2kYGaKbd6Mz
	 lJLFs9fEDvYOt4+Wm7ktzT6txkoQB7QNof2DkRL76tJqkh9TZKTEmiSqzwpURhQC2r
	 oMZc30ylO4yhBm2F3QvYNg2ElHq1bRKBlx7OCH2hkGg03w7P4jPO6vfZ4JXdujSTaM
	 +uSCQWIy/EpyQ==
Message-ID: <3593e51f6e63dfd2b163d422032203d75e8bfb25.camel@codeconstruct.com.au>
Subject: Re: [PATCH 3/3] ARM: dts: Modify I2C bus configuration
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Renze Nicolai <renze@rnplus.nl>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, arnd@arndb.de, olof@lixom.net,
 soc@kernel.org,  robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 joel@jms.id.au,  andrew@aj.id.au
Date: Wed, 03 Apr 2024 14:00:20 +1030
In-Reply-To: <20240329130152.878944-4-renze@rnplus.nl>
References: <20240329130152.878944-1-renze@rnplus.nl>
	 <20240329130152.878944-4-renze@rnplus.nl>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Renze,

On Fri, 2024-03-29 at 14:01 +0100, Renze Nicolai wrote:
> This commit enables I2C bus 8 which is exposed on the IPMB_1 connector on=
 the X570D4U mainboard.
> Additionally it adds a descriptive comment to I2C busses 1 and 5.

checkpatch on this one too :)

Cheers,

Andrew
