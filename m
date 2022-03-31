Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2EE4EDDAD
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Mar 2022 17:45:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTngl3XGcz2ynF
	for <lists+linux-aspeed@lfdr.de>; Fri,  1 Apr 2022 02:45:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=XPmCVY/C;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=129.46.98.28; helo=alexa-out.qualcomm.com;
 envelope-from=quic_jaehyoo@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=XPmCVY/C; dkim-atps=neutral
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTngb4856z2x9X
 for <linux-aspeed@lists.ozlabs.org>; Fri,  1 Apr 2022 02:45:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648741516; x=1680277516;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3cAwNZRD/3Fe85aRtAT8s08+6sVv/l46Q0SjTymOWMo=;
 b=XPmCVY/C4HE5j/ocB92NL/5rSNyxAmye1fcZZgymAzw1n/XnSollRgXF
 K5kEaNtgjUj/gUa0AkHccVxCI/bALhGmWFFnWidePFsMZ/lTUbDj06STr
 uuqdBGqUeteb494d5s36CWEuG8+eCIvH3Qy8IXuN7U/7oVmfa9Saqare+ Q=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 31 Mar 2022 08:44:13 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 08:44:12 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 31 Mar 2022 08:44:12 -0700
Received: from [10.110.21.173] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 31 Mar
 2022 08:44:10 -0700
Message-ID: <ea2ecef9-f47f-2a4e-8dda-ffd0c3691389@quicinc.com>
Date: Thu, 31 Mar 2022 08:44:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 0/7] Fix AST2600 quad mode SPI pinmux settings
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20220329173932.2588289-1-quic_jaehyoo@quicinc.com>
 <CACPK8Xed5Kh_Y2B3NY41bjgoALvz1gC4zbNfmUaHn_8EbHio4g@mail.gmail.com>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <CACPK8Xed5Kh_Y2B3NY41bjgoALvz1gC4zbNfmUaHn_8EbHio4g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linus.walleij@linaro.org>, Jamie Iles <quic_jiles@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Graeme Gregory <quic_ggregory@quicinc.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 3/30/2022 10:50 PM, Joel Stanley wrote:
> On Tue, 29 Mar 2022 at 17:40, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>>
>> I’m sending this patch series to fix current issues in AST2600 pinmux
>> settings while enabling quad mode SPI support.
>>
>> FWSPI18 pins are basically 1.8v logic pins that are different from the
>> dedicated FWSPI pins that provide 3.3v logic level, so FWSPI18 pins can’t
>> be grouped with FWSPIDQ2 and FWSPIDQ3, so this series fix the issue.
>>
>> Also, fixes QSPI1 and QSPI2 function settings in AST2600 pinctrl dtsi to
>> make it able to enable quad mode on SPI1 and SPI2 interfaces.
>>
>> With this series, quad mode pinmux can be set like below.
>>
>> FW SPI:
>> &fmc {
>>          pinctrl-names = "default";
>>          pinctrl-0 = <&pinctrl_fwqspi_default>;
>> }
>>
>> SPI1:
>> &spi1 {
>>          pinctrl-names = "default";
>>          pinctrl-0 = <&pinctrl_qspi1_default>;
>> }
>>
>> SPI2:
>> &spi2 {
>>          pinctrl-names = "default";
>>          pinctrl-0 = <&pinctrl_qspi2_default>;
>> }
> 
> Thanks. I hope to see a board from you that uses this soon :)
> 
> I'll send the patches as fixes once -rc1 is out.

Thanks Joel!

Yes, I would be able to send my BMC board dts soon.
Thanks in advance for your review on that too.

Best,
Jae

>>
>> Please review.
>>
>> Thanks,
>> Jae
>>
>> Changes in v3:
>>   * Added bindings patches. (Andrew)
>>
>> Changes in v2:
>>   * Rebased it on the latest.
>>
>> Jae Hyun Yoo (5):
>>    ARM: dts: aspeed-g6: remove FWQSPID group in pinctrl dtsi
>>    pinctrl: pinctrl-aspeed-g6: remove FWQSPID group in pinctrl
>>    dt-bindings: pinctrl: aspeed-g6: remove FWQSPID group
>>    dt-bindings: pinctrl: aspeed-g6: add FWQSPI function/group
>>    ARM: dts: aspeed-g6: fix SPI1/SPI2 quad pin group
>>
>> Johnny Huang (2):
>>    pinctrl: pinctrl-aspeed-g6: add FWQSPI function-group
>>    ARM: dts: aspeed-g6: add FWQSPI group in pinctrl dtsi
>>
>>   .../pinctrl/aspeed,ast2600-pinctrl.yaml         |  4 ++--
>>   arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi        | 10 +++++-----
>>   drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c      | 17 ++++++++---------
>>   3 files changed, 15 insertions(+), 16 deletions(-)
>>
>> --
>> 2.25.1
>>
