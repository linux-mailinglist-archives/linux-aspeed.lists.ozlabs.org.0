Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 420675175BA
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 May 2022 19:27:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KsVQq0fBQz3bc1
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 May 2022 03:27:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.121.110;
 helo=1.mo548.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 1.mo548.mail-out.ovh.net (1.mo548.mail-out.ovh.net
 [178.32.121.110])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KsVQg1cbvz3bXR
 for <linux-aspeed@lists.ozlabs.org>; Tue,  3 May 2022 03:27:20 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.206])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 40C7320A88;
 Mon,  2 May 2022 16:09:01 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 2 May
 2022 18:08:59 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S0015a36cd29-1587-4259-883a-5c3137477e16,
 1C738C3314058F8CE8CF02D37F1FC3678EA14F63) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <449f47d2-f700-e71d-996b-ce30c6906d89@kaod.org>
Date: Mon, 2 May 2022 18:08:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 02/11] dt-bindings: spi: Add Aspeed SMC controllers
 device tree binding
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220502081341.203369-1-clg@kaod.org>
 <20220502081341.203369-3-clg@kaod.org>
 <1651505609.452113.1161768.nullmailer@robh.at.kernel.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <1651505609.452113.1161768.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 256f9c92-6a2e-4112-84d2-d224bad78371
X-Ovh-Tracer-Id: 152277964116167437
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgdeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepudehkedtudfhgfelgffggfeffeefgefhudejvdekveeuveegieelteejiedugeevnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrth
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
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed@lists.ozlabs.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 5/2/22 17:33, Rob Herring wrote:
> On Mon, 02 May 2022 10:13:32 +0200, Cédric Le Goater wrote:
>> The "interrupt" property is optional because it is only necessary for
>> controllers supporting DMAs (Not implemented yet in the new driver).
>>
>> Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
>> Tested-by: Joel Stanley <joel@jms.id.au>
>> Tested-by: Tao Ren <rentao.bupt@gmail.com>
>> Tested-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
>> Reviewed-by: Joel Stanley <joel@jms.id.au>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   .../bindings/spi/aspeed,ast2600-fmc.yaml      | 82 +++++++++++++++++++
>>   MAINTAINERS                                   |  9 ++
>>   2 files changed, 91 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml:62:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

drat. I forgot to rerun the check after prettifying the example.

Will resend a v6 without the tabs.

Thanks,

C.

> 
> dtschema/dtc warnings/errors:
> make[1]: *** Deleting file 'Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.example.dts'
> Traceback (most recent call last):
>    File "/usr/local/bin/dt-extract-example", line 52, in <module>
>      binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
>    File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/main.py", line 434, in load
>      return constructor.get_single_data()
>    File "/usr/local/lib/python3.10/dist-packages/ruamel/yaml/constructor.py", line 119, in get_single_data
>      node = self.composer.get_single_node()
>    File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
>    File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
>    File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
>    File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
>    File "_ruamel_yaml.pyx", line 773, in _ruamel_yaml.CParser._compose_node
>    File "_ruamel_yaml.pyx", line 848, in _ruamel_yaml.CParser._compose_sequence_node
>    File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
> ruamel.yaml.scanner.ScannerError: while scanning a block scalar
>    in "<unicode string>", line 49, column 5
> found a tab character where an indentation space is expected
>    in "<unicode string>", line 62, column 1
> make[1]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.example.dts] Error 1
> make[1]: *** Waiting for unfinished jobs....
> ./Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml:  while scanning a block scalar
>    in "<unicode string>", line 49, column 5
> found a tab character where an indentation space is expected
>    in "<unicode string>", line 62, column 1
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml: ignoring, error parsing file
> make: *** [Makefile:1401: dt_binding_check] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 

