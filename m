Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE04444571
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Nov 2021 17:09:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HksCf39sQz2yHL
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Nov 2021 03:09:18 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HksCZ3x62z2xCB
 for <linux-aspeed@lists.ozlabs.org>; Thu,  4 Nov 2021 03:09:13 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="212285168"
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; d="scan'208";a="212285168"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 09:08:06 -0700
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; d="scan'208";a="450118825"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.212.171.79])
 ([10.212.171.79])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 09:08:04 -0700
Message-ID: <8db279c9-4c76-91a5-3617-a17effb2d103@linux.intel.com>
Date: Wed, 3 Nov 2021 09:08:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH -next v2 5/6] dt-bindings: ipmi: aspeed,kcs-bmc: add
 'clocks' as a required property
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, jae.hyun.yoo@intel.com
References: <20211102203717.96794-1-jae.hyun.yoo@intel.com>
 <20211102203717.96794-6-jae.hyun.yoo@intel.com>
 <1635902437.654631.3880388.nullmailer@robh.at.kernel.org>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
In-Reply-To: <1635902437.654631.3880388.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Corey Minyard <minyard@acm.org>, linux-aspeed@lists.ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, openipmi-developer@lists.sourceforge.net,
 Haiyue Wang <haiyue.wang@linux.intel.com>, Cedric Le Goater <clg@kaod.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Rob,

On 11/2/2021 6:20 PM, Rob Herring wrote:
> On Tue, 02 Nov 2021 13:37:16 -0700, jae.hyun.yoo@intel.com wrote:
>> From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>
>> Add 'clocks' as a required property.
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> ---
>> v1 -> v2:
>> Changes sinve v1:
>>   - Added 'clocks' property into kcs-bmc bindings using
>>     'aspeed,ast2400-kcs-bmc.yaml' because it's not merged into
>>     'aspeed-lpc.yaml' yet. The bindings merging could be done using a
>>     separate patch later.
>>
>>   .../devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml   | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> 
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
> 
> Full log is available here: https://patchwork.ozlabs.org/patch/1549943
> 
> 
> kcs@114: 'clocks' is a required property
> 	arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dt.yaml
> 	arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dt.yaml
> 	arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dt.yaml
> 
> kcs@24: 'clocks' is a required property
> 	arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dt.yaml
> 
> kcs@28: 'clocks' is a required property
> 	arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dt.yaml
> 	arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dt.yaml
> 	arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt.yaml
> 
> kcs@2c: 'clocks' is a required property
> 	arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dt.yaml
> 	arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dt.yaml
> 	arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dt.yaml
> 	arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dt.yaml
> 	arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt.yaml
> 	arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dt.yaml
> 

#4/6 in this patch adds 'clocks' into aspeed-g5.dtsi and aspeed-g6.dtsi
as a default property and all above dts files include the dtsi file so
these warning shouldn't be seen. Is it a result after applying all
changes in this series or just after cherry picking #5/6 patch only?

I tested 'dtbs_check' before submitting this series I tested it again
and got the same good result like below.

Aren't the above warnings false positive? Or did I miss something?

Thanks,
Jae

$ ARCH=arm make dtbs_check 
DT_SCHEMA_FILES=Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
   HOSTCC  scripts/basic/fixdep
   HOSTCC  scripts/dtc/dtc.o
   HOSTCC  scripts/dtc/flattree.o
   HOSTCC  scripts/dtc/fstree.o
   HOSTCC  scripts/dtc/data.o
   HOSTCC  scripts/dtc/livetree.o
   HOSTCC  scripts/dtc/treesource.o
   HOSTCC  scripts/dtc/srcpos.o
   HOSTCC  scripts/dtc/checks.o
   HOSTCC  scripts/dtc/util.o
   LEX     scripts/dtc/dtc-lexer.lex.c
   YACC    scripts/dtc/dtc-parser.tab.[ch]
   HOSTCC  scripts/dtc/dtc-lexer.lex.o
   HOSTCC  scripts/dtc/dtc-parser.tab.o
   HOSTCC  scripts/dtc/yamltree.o
   HOSTLD  scripts/dtc/dtc
   HOSTCC  scripts/dtc/libfdt/fdt.o
   HOSTCC  scripts/dtc/libfdt/fdt_ro.o
   HOSTCC  scripts/dtc/libfdt/fdt_wip.o
   HOSTCC  scripts/dtc/libfdt/fdt_sw.o
   HOSTCC  scripts/dtc/libfdt/fdt_rw.o
   HOSTCC  scripts/dtc/libfdt/fdt_strerror.o
   HOSTCC  scripts/dtc/libfdt/fdt_empty_tree.o
   HOSTCC  scripts/dtc/libfdt/fdt_addresses.o
   HOSTCC  scripts/dtc/libfdt/fdt_overlay.o
   HOSTCC  scripts/dtc/fdtoverlay.o
   HOSTLD  scripts/dtc/fdtoverlay
   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
   DTC     arch/arm/boot/dts/aspeed-ast2500-evb.dtb
   DTC     arch/arm/boot/dts/aspeed-ast2600-evb-a1.dtb
   DTC     arch/arm/boot/dts/aspeed-ast2600-evb.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-facebook-galaxy100.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-facebook-yamp.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-ibm-everest.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-opp-nicole.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-opp-romulus.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-opp-swift.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-opp-zaius.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-supermicro-x11spi.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dtb
   DTC     arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dtb
   DTC     arch/arm/boot/dts/aspeed-ast2500-evb.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-ast2500-evb.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-ast2600-evb-a1.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-ast2600-evb-a1.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-ast2600-evb.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-ast2600-evb.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-facebook-elbert.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-facebook-galaxy100.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-facebook-galaxy100.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-facebook-yamp.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-facebook-yamp.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-ibm-everest.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-ibm-everest.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-opp-nicole.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-opp-nicole.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-opp-romulus.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-opp-romulus.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-opp-swift.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-opp-swift.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-opp-zaius.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-opp-zaius.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-supermicro-x11spi.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-supermicro-x11spi.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dt.yaml
   DTC     arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dt.yaml
   CHECK   arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dt.yaml
