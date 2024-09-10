Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA698973999
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Sep 2024 16:15:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X35M84cBJz2yhg
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Sep 2024 00:15:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725977713;
	cv=none; b=LbbMmR7Qv56y84ZnzP1kY2yEsg7iyoEu80Y//IWlEMkNct6TkErbUlBRf77+/kCiJ+Co4C8SfNBV+S+WS/XTQlDVE097Lzd3ujySG6/v5jcphQtLp0nAdKnEHRy9EyOMA2HiNTL5JltC+WF1fYnrHkFvyyrpBx0Wkc+PX67QXBohyn50xOIZuCgKp6PFvZCRX9MdrQNKwMrVH9vy9ShhYY2bwxChIp2kKR0uiXNCQ5GUuYJ8FA4okiu5Rb+YhChg/9+QFny3C08EYuNuxMcSktKSeGf4gMjw6lZP/mcvy6jtqhqWMETaPT1ALaF3opmtlMNeTYQcX9lT+EMGlGLWdg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725977713; c=relaxed/relaxed;
	bh=xz4N48t+I0tMZB5tWWhQduOfvTKkhjEDg9cVrEMlsbI=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=nKmAb7FiXXFy9W4x8UyQ16xniE+di4b8tu+Njn3CJscWieV9Nq9GgXcHcYgZ0L52nP4uXntQpHxLS2ZB2ZSrNBHalXlbL9sm7ZyrA0FxlCvkMkL2XGtIKOVzz49M/orTHa4IeLfjX9vMT77907exkPr4TheDDgP+tom8AVaO1PhpPs3VjNOTjWnPNnPNRZhl9bj4EKAzyj7xdJDqxzBSHJne0fECyxDPpEcsJzMxoeOf5MipF0WKw+MzzoVZOwp2krbsq3yaF72yiKM+w1e9sH2nz0TysgzB+DpIX/0NQfKwRE/i60VM9C+dcc6B7YWfdrGv9/7K1jTR+bdsBoYmbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n/jMuS4k; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n/jMuS4k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X35M46T6Lz2yV3
	for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Sep 2024 00:15:12 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 713EDA4485F;
	Tue, 10 Sep 2024 14:15:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B6C7C4CEC3;
	Tue, 10 Sep 2024 14:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725977709;
	bh=2q/oRP/z24x3wXJrWke2txA1/pI+xJSwgIxaXIuvfCs=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=n/jMuS4kKKbVxqSjqIC47acN2ibCoFoiAcQ6xxLEQF1O1GWmdXMi1KMbnmOxXXEMf
	 zMzzZbv+PHv4yaK6obSjuSUE85LSt6yQAwfjk6Tgs8Yr8lt01GoWSOltQpFxDwMVtm
	 0oxLRWiYN1iYgGrtu5nC75n/+LTiDBpSOrgY9mLWN0h4m/OwQb4pRIXFExzv9o4WQ/
	 ExQBc6L1d6GuJceKvHiGuReGKVGmYFu8e6vlk0oNiSIxKKVye54Gh6FE+sPtDnm2bJ
	 CqQJ3AO5lavHAjLgM+3exDDxgYGSboAtyx6G2/hGUWaVhRnn50dfo3Dm3M7IifPFAu
	 npZsThumfzvVw==
Date: Tue, 10 Sep 2024 09:15:08 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
In-Reply-To: <20240910075357.3531211-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240910075357.3531211-1-Delphine_CC_Chiu@wiwynn.com>
Message-Id: <172597760852.3917242.15739474117640537130.robh@kernel.org>
Subject: Re: [PATCH v1] ARM: dts: aspeed: yosemite4: Add power module and
 ADC on Medusa Board
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Tue, 10 Sep 2024 15:53:56 +0800, Delphine CC Chiu wrote:
> From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
> 
> Add RTQ6056 as 2nd source ADC sensor on Medusa Board.
> Add power sensors on Medusa board:
> - Add XDP710 as 2nd source HSC to monitor P48V PSU power.
> - Add MP5023 as P12V efuse (Driver exists but un-documented).
> - Add PMBUS sensors as P12V Delta Module.
> 
> Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---
>  .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 45 ++++++++++++++++++-
>  1 file changed, 43 insertions(+), 2 deletions(-)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y aspeed/aspeed-bmc-facebook-yosemite4.dtb' for 20240910075357.3531211-1-Delphine_CC_Chiu@wiwynn.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c@600/power-sensor@40: failed to match any schema with compatible: ['mps,mp5023']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c@600/power-sensor@62: failed to match any schema with compatible: ['pmbus']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c@600/power-sensor@64: failed to match any schema with compatible: ['pmbus']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c@600/power-sensor@65: failed to match any schema with compatible: ['pmbus']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c@600/power-sensor@68: failed to match any schema with compatible: ['pmbus']





