Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C528A5333EF
	for <lists+linux-aspeed@lfdr.de>; Wed, 25 May 2022 01:30:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L79RM5WGnz3bZc
	for <lists+linux-aspeed@lfdr.de>; Wed, 25 May 2022 09:30:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=zBDnY/PK;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=129.46.98.28; helo=alexa-out.qualcomm.com;
 envelope-from=quic_ggregory@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=zBDnY/PK; dkim-atps=neutral
X-Greylist: delayed 184 seconds by postgrey-1.36 at boromir;
 Tue, 24 May 2022 22:14:31 AEST
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6tRW3bSjz308C
 for <linux-aspeed@lists.ozlabs.org>; Tue, 24 May 2022 22:14:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1653394471; x=1684930471;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PfmB9hEUx2CjDIiO5rF0JMaOGwrL95sGWUUs2zyUTJI=;
 b=zBDnY/PKuI/V2Y2MBaYOmLEFQFZIktPTBm+voKFGK3+NJnSFdzvUaHpb
 3lsQ93pn3gWz7Tp/Qt3rot1c2gN9+eHeS4lNNO2xLMiNdTMpP3RdJN4ZA
 y53n2e7V1/ylVWq1Sb0/gnz9F5hkERsvGPn/P0SPbpfho9ZXi5DiJdRux g=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 24 May 2022 05:10:25 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 05:10:24 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 24 May 2022 05:10:24 -0700
Received: from quicinc.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 24 May
 2022 05:10:23 -0700
Date: Tue, 24 May 2022 13:02:46 +0100
From: Graeme Gregory <quic_ggregory@quicinc.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH -next] ARM: dts: aspeed: nuvia: rename vendor nuvia to qcom
Message-ID: <20220524120246.vbk6r5ltopj7ciem@ggregory-linuxws>
References: <20220523175640.60155-1-quic_jaehyoo@quicinc.com>
 <dd67a453-b75b-d092-f999-3faf05ef8160@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <dd67a453-b75b-d092-f999-3faf05ef8160@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Mailman-Approved-At: Wed, 25 May 2022 09:28:38 +1000
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Arnd Bergmann <arnd@arndb.de>, Jamie Iles <quic_jiles@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, May 24, 2022 at 11:53:17AM +0200, Krzysztof Kozlowski wrote:
> On 23/05/2022 19:56, Jae Hyun Yoo wrote:
> > Nuvia has been acquired by Qualcomm and the vendor name 'nuvia' will
> > not be used anymore so rename aspeed-bmc-nuvia-dc-scm.dts to
> > aspeed-bmc-qcom-dc-scm-v1.dts and change 'nuvia' to 'qcom' as its vendor
> > name in the file.
> 
> And all users of this DTB now have to update their bootloaders, scripts,
> installation methods. We did not rename FSL or Marvell boards, so
> neither should be renamed this one.
> 

This board does not exist to the public yet! That makes all users
limited to those on Cc: with quicinc emails!

Graeme

> > 
> > Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> > ---
> >  arch/arm/boot/dts/Makefile                                    | 2 +-
> >  ...eed-bmc-nuvia-dc-scm.dts => aspeed-bmc-qcom-dc-scm-v1.dts} | 4 ++--
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >  rename arch/arm/boot/dts/{aspeed-bmc-nuvia-dc-scm.dts => aspeed-bmc-qcom-dc-scm-v1.dts} (97%)
> > 
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index 03f5b3a15415..2a3c95387613 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -1584,7 +1584,6 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
> >  	aspeed-bmc-lenovo-hr630.dtb \
> >  	aspeed-bmc-lenovo-hr855xg2.dtb \
> >  	aspeed-bmc-microsoft-olympus.dtb \
> > -	aspeed-bmc-nuvia-dc-scm.dtb \
> >  	aspeed-bmc-opp-lanyang.dtb \
> >  	aspeed-bmc-opp-mihawk.dtb \
> >  	aspeed-bmc-opp-mowgli.dtb \
> > @@ -1597,6 +1596,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
> >  	aspeed-bmc-opp-witherspoon.dtb \
> >  	aspeed-bmc-opp-zaius.dtb \
> >  	aspeed-bmc-portwell-neptune.dtb \
> > +	aspeed-bmc-qcom-dc-scm-v1.dtb \
> >  	aspeed-bmc-quanta-q71l.dtb \
> >  	aspeed-bmc-quanta-s6q.dtb \
> >  	aspeed-bmc-supermicro-x11spi.dtb \
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts b/arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dts
> > similarity index 97%
> > rename from arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts
> > rename to arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dts
> > index f4a97cfb0f23..259ef3f54c5c 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dts
> > @@ -6,8 +6,8 @@
> >  #include "aspeed-g6.dtsi"
> >  
> >  / {
> > -	model = "Nuvia DC-SCM BMC";
> > -	compatible = "nuvia,dc-scm-bmc", "aspeed,ast2600";
> > +	model = "Qualcomm DC-SCM V1 BMC";
> > +	compatible = "qcom,dc-scm-v1-bmc", "aspeed,ast2600";
> 
> 
> You need also change bindings.
> 
> 
> Best regards,
> Krzysztof
